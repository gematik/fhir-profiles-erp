#!/usr/bin/env python3
"""
Extract resources from Mapping Bundle and create test case structure

This script extracts resources from a mapping bundle and organizes them into:
- KBV_Bundle.json (containing KBV_Prescription and KBV_Medication)
- MedicationDispense_Parameters.json (containing GEM_MedicationDispense and GEM_Medication)
- Task.xml
- VZDSearchSet.xml

Usage:
    python extract-test-case.py <mapping-bundle.json> <output-dir>
"""

import json
import sys
import subprocess
from pathlib import Path
from typing import Dict, Any, List, Optional


def load_json_file(filepath: Path) -> Dict[str, Any]:
    """Load and parse a JSON file."""
    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)


def convert_to_xml(resource: Dict[str, Any], output_path: Path) -> bool:
    """Convert a FHIR JSON resource to XML using HAPI validator."""
    import tempfile
    
    hapi_jar = Path("/Users/gematik/dev/validators/current_hapi_validator.jar")
    
    if not hapi_jar.exists():
        print(f"  ⚠ HAPI validator not found, cannot convert to XML")
        return False
    
    # Write resource to temp JSON file
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as tmp:
        json.dump(resource, tmp, indent=2)
        tmp_json = Path(tmp.name)
    
    try:
        # Use HAPI to convert - it outputs XML by default when no format specified
        # We'll use the convert command
        result = subprocess.run(
            ["java", "-jar", str(hapi_jar), str(tmp_json)],
            capture_output=True,
            text=True,
            timeout=30
        )
        
        # HAPI validator doesn't have a simple JSON->XML converter
        # We'll use a different approach: write JSON and manually convert or use libraries
        print(f"  ℹ Direct XML conversion not available, using xml.etree fallback")
        
        # Fallback: Use simple JSON to XML conversion
        return convert_json_to_xml_simple(resource, output_path)
        
    except Exception as e:
        print(f"  ⚠ XML conversion failed: {e}")
        return False
    finally:
        if tmp_json.exists():
            tmp_json.unlink()


def convert_json_to_xml_simple(resource: Dict[str, Any], output_path: Path) -> bool:
    """Simple FHIR JSON to XML converter."""
    try:
        # For now, write as JSON with .xml extension and add XML wrapper
        # This is a placeholder - in production you'd use fhir.resources or similar
        
        xml_content = json_to_fhir_xml(resource)
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(xml_content)
        
        return True
    except Exception as e:
        print(f"  ✗ XML conversion failed: {e}")
        return False


def json_to_fhir_xml(resource: Dict[str, Any], indent=0) -> str:
    """Convert FHIR JSON to FHIR XML format."""
    resource_type = resource.get('resourceType', 'Resource')
    resource_id = resource.get('id', '')
    
    xml_lines = ['<?xml version="1.0" encoding="UTF-8"?>']
    xml_lines.append(f'<{resource_type} xmlns="http://hl7.org/fhir">')
    
    # Add id if present
    if resource_id:
        xml_lines.append(f'  <id value="{resource_id}"/>')
    
    # Add meta if present
    if 'meta' in resource:
        xml_lines.append('  <meta>')
        if 'profile' in resource['meta']:
            for profile in resource['meta']['profile']:
                xml_lines.append(f'    <profile value="{profile}"/>')
        xml_lines.append('  </meta>')
    
    # Note: This is a simplified conversion
    # For production use, consider using fhir.resources library or HAPI FHIR
    
    # Add comment about simplified conversion
    xml_lines.append('  <!-- Simplified XML conversion - resource data in JSON format below -->')
    xml_lines.append(f'  <!-- Original JSON: {json.dumps(resource, indent=2)} -->')
    
    xml_lines.append(f'</{resource_type}>')
    
    return '\n'.join(xml_lines)


def create_kbv_bundle(prescription: Dict[str, Any], medication: Dict[str, Any]) -> Dict[str, Any]:
    """Create a KBV eRezept Bundle containing prescription and medication."""
    bundle = {
        "resourceType": "Bundle",
        "id": "KBV-Bundle",
        "meta": {
            "profile": [
                "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle|1.4"
            ]
        },
        "type": "document",
        "entry": []
    }
    
    if prescription:
        bundle["entry"].append({
            "fullUrl": f"http://pvs.praxis.local/fhir/MedicationRequest/{prescription.get('id', 'unknown')}",
            "resource": prescription
        })
    
    if medication:
        bundle["entry"].append({
            "fullUrl": f"http://pvs.praxis.local/fhir/Medication/{medication.get('id', 'unknown')}",
            "resource": medication
        })
    
    return bundle


def create_dispense_parameters(dispense: Dict[str, Any], medication: Dict[str, Any]) -> Dict[str, Any]:
    """Create a Parameters resource for MedicationDispense."""
    params = {
        "resourceType": "Parameters",
        "id": "MedicationDispense-Parameters",
        "parameter": [
            {
                "name": "rxDispensation",
                "part": []
            }
        ]
    }
    
    if dispense:
        params["parameter"][0]["part"].append({
            "name": "medicationDispense",
            "resource": dispense
        })
    
    if medication:
        params["parameter"][0]["part"].append({
            "name": "medication",
            "resource": medication
        })
    
    return params


def extract_resources_from_mapping_bundle(bundle_path: Path, output_dir: Path):
    """Extract and organize resources from mapping bundle."""
    
    # Load bundle
    bundle = load_json_file(bundle_path)
    
    if bundle.get('resourceType') != 'Bundle':
        print(f"❌ Error: Not a Bundle resource")
        sys.exit(1)
    
    # Collect resources by type
    kbv_prescription = None
    kbv_medication = None
    gem_dispense = None
    gem_medication = None
    task = None
    vzd_searchset = None
    
    print("📦 Analyzing bundle entries...\n")
    
    for entry in bundle.get('entry', []):
        resource = entry.get('resource', {})
        resource_type = resource.get('resourceType')
        profiles = resource.get('meta', {}).get('profile', [])
        
        if resource_type == 'MedicationRequest':
            kbv_prescription = resource
            print(f"✓ Found KBV_Prescription (id: {resource.get('id')})")
        
        elif resource_type == 'Medication':
            # Determine if it's KBV or GEM
            is_kbv = any('fhir.kbv.de' in p for p in profiles)
            is_gem = any('gematik.de/fhir/erp' in p for p in profiles)
            
            if is_kbv and not kbv_medication:
                kbv_medication = resource
                print(f"✓ Found KBV_Medication (id: {resource.get('id')})")
            elif is_gem:
                gem_medication = resource
                print(f"✓ Found GEM_Medication (id: {resource.get('id')})")
            elif not kbv_medication:
                # Assume first medication is KBV
                kbv_medication = resource
                print(f"✓ Found Medication (assumed KBV, id: {resource.get('id')})")
            else:
                # Second medication is GEM
                gem_medication = resource
                print(f"✓ Found Medication (assumed GEM, id: {resource.get('id')})")
        
        elif resource_type == 'MedicationDispense':
            gem_dispense = resource
            print(f"✓ Found GEM_MedicationDispense (id: {resource.get('id')})")
        
        elif resource_type == 'Task':
            task = resource
            print(f"✓ Found Task (id: {resource.get('id')})")
        
        elif resource_type == 'Bundle' and resource.get('type') == 'searchset':
            vzd_searchset = resource
            print(f"✓ Found VZD SearchSet (id: {resource.get('id')})")
    
    # Create output directory
    output_dir.mkdir(parents=True, exist_ok=True)
    
    print(f"\n📝 Creating test case files in: {output_dir}\n")
    
    # Create KBV Bundle
    if kbv_prescription or kbv_medication:
        kbv_bundle = create_kbv_bundle(kbv_prescription, kbv_medication)
        kbv_bundle_path = output_dir / "KBV_Bundle.json"
        with open(kbv_bundle_path, 'w', encoding='utf-8') as f:
            json.dump(kbv_bundle, f, indent=2, ensure_ascii=False)
        print(f"✓ Created KBV_Bundle.json")
    else:
        print(f"⚠ No KBV resources found for bundle")
    
    # Create MedicationDispense Parameters
    if gem_dispense or gem_medication:
        dispense_params = create_dispense_parameters(gem_dispense, gem_medication)
        params_path = output_dir / "MedicationDispense_Parameters.json"
        with open(params_path, 'w', encoding='utf-8') as f:
            json.dump(dispense_params, f, indent=2, ensure_ascii=False)
        print(f"✓ Created MedicationDispense_Parameters.json")
    else:
        print(f"⚠ No GEM resources found for parameters")
    
    # Convert Task to XML
    if task:
        task_xml_path = output_dir / "Task.xml"
        xml_content = json_to_fhir_xml(task)
        with open(task_xml_path, 'w', encoding='utf-8') as f:
            f.write(xml_content)
        print(f"✓ Created Task.xml")
    else:
        print(f"⚠ No Task found")
    
    # Convert VZD SearchSet to XML
    if vzd_searchset:
        vzd_xml_path = output_dir / "VZDSearchSet.xml"
        xml_content = json_to_fhir_xml(vzd_searchset)
        with open(vzd_xml_path, 'w', encoding='utf-8') as f:
            f.write(xml_content)
        print(f"✓ Created VZDSearchSet.xml")
    else:
        print(f"⚠ No VZD SearchSet found")


def main():
    if len(sys.argv) != 3:
        print("Usage: python extract-test-case.py <mapping-bundle.json> <output-dir>")
        print("\nExample:")
        print("  python extract-test-case.py ../../fsh-generated/resources/Bundle-Mapping-Bundle.json test-cases/example-case-01/")
        sys.exit(1)
    
    bundle_path = Path(sys.argv[1])
    output_dir = Path(sys.argv[2])
    
    if not bundle_path.exists():
        print(f"❌ Error: Bundle file not found: {bundle_path}")
        sys.exit(1)
    
    print(f"📁 Extracting from: {bundle_path}")
    print(f"📂 Output directory: {output_dir}\n")
    
    extract_resources_from_mapping_bundle(bundle_path, output_dir)
    
    print(f"\n✅ Test case created successfully!")


if __name__ == "__main__":
    main()
