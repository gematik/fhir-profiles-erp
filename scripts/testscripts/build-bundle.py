#!/usr/bin/env python3
"""
Build Mapping Bundle from Individual FHIR Resources

This script reads individual FHIR resource JSON files from a test case directory
and creates a mapping bundle (type: collection) suitable for StructureMap transformation.

Expected files in test case directory:
- KBV_Prescription.json (MedicationRequest)
- KBV_Medication_*.json (any KBV Medication profile)
- GEM_ERP_PR_Medication.json (GEM Medication from workflow)
- GEM_MedicationDispense.json (MedicationDispense)
- VZDSearchSet.json (VZD SearchSet Bundle)
- Task.json (Task in closed state)

Usage:
    python build-bundle.py <test-case-dir> <output-file>
"""

import json
import sys
import re
import shutil
import subprocess
import tempfile
from pathlib import Path
from typing import Any, Dict, List, Optional


def load_json_file(filepath: Path) -> Dict[str, Any]:
    """Load and parse a JSON file."""
    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)


def create_bundle_entry(resource: Dict[str, Any], full_url: str) -> Dict[str, Any]:
    """Create a bundle entry with the given resource."""
    return {
        "fullUrl": full_url,
        "resource": resource
    }


def normalize_references(resource: Dict[str, Any]) -> Dict[str, Any]:
    """
    Normalize all references in a resource to use urn:uuid format.
    Converts references like "Medication/abc-123" to "urn:uuid:abc-123"
    """
    def normalize_value(obj: Any) -> Any:
        if isinstance(obj, dict):
            result = {}
            for key, value in obj.items():
                if key == "reference" and isinstance(value, str):
                    # Convert relative references to urn:uuid format
                    # e.g., "Medication/abc-123" -> "urn:uuid:abc-123"
                    if not value.startswith(("http://", "https://", "urn:", "#")):
                        if "/" in value:
                            # Extract ID from "ResourceType/id" format
                            resource_id = value.split("/")[-1]
                            result[key] = f"urn:uuid:{resource_id}"
                        else:
                            # Already just an ID
                            result[key] = f"urn:uuid:{value}"
                    else:
                        result[key] = value
                else:
                    result[key] = normalize_value(value)
            return result
        elif isinstance(obj, list):
            return [normalize_value(item) for item in obj]
        else:
            return obj
    
    return normalize_value(resource)


def load_xml_file(filepath: Path) -> Dict[str, Any]:
    """Load and parse an XML file, converting to dict representation."""
    import xml.etree.ElementTree as ET
    tree = ET.parse(filepath)
    root = tree.getroot()
    # For now, we'll read it as text and let the caller handle it
    with open(filepath, 'r', encoding='utf-8') as f:
        return {"xml_content": f.read(), "root_element": root.tag}


def extract_from_kbv_bundle(kbv_bundle: Dict[str, Any]) -> tuple[Dict[str, Any], Dict[str, Any]]:
    """Extract KBV_Prescription and KBV_Medication from KBV eRezept Bundle."""
    prescription = None
    medication = None
    
    for entry in kbv_bundle.get('entry', []):
        resource = entry.get('resource', {})
        resource_type = resource.get('resourceType')
        
        if resource_type == 'MedicationRequest':
            prescription = resource
            print(f"  → Extracted KBV_Prescription (id: {resource.get('id', 'unknown')})")
        elif resource_type == 'Medication':
            medication = resource
            print(f"  → Extracted KBV_Medication (id: {resource.get('id', 'unknown')})")
    
    return prescription, medication


def extract_from_dispense_parameters(params: Dict[str, Any]) -> tuple[Dict[str, Any], Dict[str, Any]]:
    """Extract GEM_MedicationDispense and GEM_Medication from Parameters resource."""
    dispense = None
    medication = None
    
    for param in params.get('parameter', []):
        if param.get('name') == 'rxDispensation':
            for part in param.get('part', []):
                resource = part.get('resource', {})
                resource_type = resource.get('resourceType')
                
                if resource_type == 'MedicationDispense':
                    dispense = resource
                    print(f"  → Extracted GEM_MedicationDispense (id: {resource.get('id', 'unknown')})")
                elif resource_type == 'Medication':
                    medication = resource
                    print(f"  → Extracted GEM_Medication (id: {resource.get('id', 'unknown')})")
    
    return dispense, medication


def normalize_medication_request_structure(resource: Dict[str, Any]) -> None:
    """Ensure list-valued MedicationRequest fields stay arrays in JSON."""
    if resource.get("resourceType") != "MedicationRequest":
        return

    dosage_instructions = resource.get("dosageInstruction")
    if isinstance(dosage_instructions, dict):
        resource["dosageInstruction"] = [dosage_instructions]
        dosage_instructions = resource["dosageInstruction"]

    if isinstance(dosage_instructions, list):
        for dosage in dosage_instructions:
            if not isinstance(dosage, dict):
                continue

            dose_and_rate = dosage.get("doseAndRate")
            if isinstance(dose_and_rate, dict):
                dosage["doseAndRate"] = [dose_and_rate]

            timing = dosage.get("timing")
            if not isinstance(timing, dict):
                continue

            repeat = timing.get("repeat")
            if not isinstance(repeat, dict):
                continue

            when_value = repeat.get("when")
            # FHIR requires repeat.when to be an array even if a single code is present.
            if isinstance(when_value, str):
                repeat["when"] = [when_value]
            elif when_value is not None and not isinstance(when_value, list):
                repeat["when"] = [when_value]


def normalize_medication_dispense_structure(resource: Dict[str, Any]) -> None:
    """Ensure MedicationDispense repeating elements remain arrays."""
    if resource.get("resourceType") != "MedicationDispense":
        return

    identifier = resource.get("identifier")
    if identifier is not None and not isinstance(identifier, list):
        resource["identifier"] = [identifier]

    performer = resource.get("performer")
    if performer is not None and not isinstance(performer, list):
        resource["performer"] = [performer]


def normalize_medication_structure(resource: Dict[str, Any]) -> None:
    """Ensure Medication resource uses arrays for repeating elements."""
    if resource.get("resourceType") != "Medication":
        return

    identifier = resource.get("identifier")
    if identifier is not None and not isinstance(identifier, list):
        resource["identifier"] = [identifier]

    code = resource.get("code")
    if isinstance(code, dict):
        coding = code.get("coding")
        if coding is not None and not isinstance(coding, list):
            code["coding"] = [coding]

    form = resource.get("form")
    if isinstance(form, dict):
        coding = form.get("coding")
        if coding is not None and not isinstance(coding, list):
            form["coding"] = [coding]

    ingredient = resource.get("ingredient")
    if ingredient is not None and not isinstance(ingredient, list):
        resource["ingredient"] = [ingredient]

    for ingredient_item in resource.get("ingredient", []):
        strength = ingredient_item.get("strength")
        if isinstance(strength, dict):
            numerator = strength.get("numerator")
            if isinstance(numerator, dict):
                extension = numerator.get("extension")
                if extension is not None and not isinstance(extension, list):
                    numerator["extension"] = [extension]
            denominator = strength.get("denominator")
            if isinstance(denominator, dict):
                extension = denominator.get("extension")
                if extension is not None and not isinstance(extension, list):
                    denominator["extension"] = [extension]

    amount = resource.get("amount")
    if isinstance(amount, dict):
        numerator = amount.get("numerator")
        if isinstance(numerator, dict):
            extension = numerator.get("extension")
            if extension is not None and not isinstance(extension, list):
                numerator["extension"] = [extension]
        denominator = amount.get("denominator")
        if isinstance(denominator, dict):
            extension = denominator.get("extension")
            if extension is not None and not isinstance(extension, list):
                denominator["extension"] = [extension]


def build_mapping_bundle(test_case_dir: Path) -> Dict[str, Any]:
    """
    Build a mapping bundle from resources in the test case directory.
    
    Expected resource files:
    - KBV_Bundle.json - KBV eRezept Bundle containing Prescription and Medication
    - MedicationDispense_Parameters.json - Parameters containing dispense and medication
    - Task.xml - Task in closed state (XML format)
    - VZDSearchSet.xml - VZD SearchSet Bundle (XML format)
    """
    bundle = {
        "resourceType": "Bundle",
        "type": "collection",
        "entry": []
    }
    
    # Use urn:uuid format for all references to maintain consistency
    # This matches how MedicationDispense references its medication
    
    # Extract from KBV Bundle (try both JSON and XML)
    kbv_bundle_json = test_case_dir / "KBV_Bundle.json"
    kbv_bundle_xml = test_case_dir / "KBV_Bundle.xml"
    
    if kbv_bundle_json.exists():
        print(f"✓ Processing KBV_Bundle.json")
        kbv_bundle = load_json_file(kbv_bundle_json)
        prescription, medication = extract_from_kbv_bundle(kbv_bundle)
        
        if prescription:
            prescription = normalize_references(prescription)
            normalize_medication_request_structure(prescription)
            resource_id = prescription.get('id', 'KBV-Prescription')
            full_url = f"urn:uuid:{resource_id}"
            bundle["entry"].append(create_bundle_entry(prescription, full_url))
        
        if medication:
            medication = normalize_references(medication)
            normalize_medication_structure(medication)
            resource_id = medication.get('id', 'KBV-Medication')
            full_url = f"urn:uuid:{resource_id}"
            bundle["entry"].append(create_bundle_entry(medication, full_url))
    elif kbv_bundle_xml.exists():
        print(f"✓ Processing KBV_Bundle.xml")
        kbv_bundle = convert_xml_to_json(kbv_bundle_xml)
        if kbv_bundle:
            prescription, medication = extract_from_kbv_bundle(kbv_bundle)
            
            if prescription:
                prescription = normalize_references(prescription)
                normalize_medication_request_structure(prescription)
                resource_id = prescription.get('id', 'KBV-Prescription')
                full_url = f"urn:uuid:{resource_id}"
                bundle["entry"].append(create_bundle_entry(prescription, full_url))
            
            if medication:
                medication = normalize_references(medication)
                normalize_medication_structure(medication)
                resource_id = medication.get('id', 'KBV-Medication')
                full_url = f"urn:uuid:{resource_id}"
                bundle["entry"].append(create_bundle_entry(medication, full_url))
    else:
        print(f"⚠ Warning: KBV_Bundle.json or KBV_Bundle.xml not found")
    
    # Extract from MedicationDispense Parameters (try both JSON and XML)
    dispense_params_json = test_case_dir / "MedicationDispense_Parameters.json"
    dispense_params_xml = test_case_dir / "MedicationDispense_Parameters.xml"
    
    if dispense_params_json.exists():
        print(f"✓ Processing MedicationDispense_Parameters.json")
        dispense_params = load_json_file(dispense_params_json)
        dispense, gem_medication = extract_from_dispense_parameters(dispense_params)
        
        if dispense:
            dispense = normalize_references(dispense)
            normalize_medication_dispense_structure(dispense)
            resource_id = dispense.get('id', 'GEM-MedicationDispense')
            full_url = f"urn:uuid:{resource_id}"
            bundle["entry"].append(create_bundle_entry(dispense, full_url))
        
        if gem_medication:
            gem_medication = normalize_references(gem_medication)
            normalize_medication_structure(gem_medication)
            resource_id = gem_medication.get('id', 'GEM-Medication')
            full_url = f"urn:uuid:{resource_id}"
            bundle["entry"].append(create_bundle_entry(gem_medication, full_url))
    elif dispense_params_xml.exists():
        print(f"✓ Processing MedicationDispense_Parameters.xml")
        dispense_params = convert_xml_to_json(dispense_params_xml)
        if dispense_params:
            dispense, gem_medication = extract_from_dispense_parameters(dispense_params)
            
            if dispense:
                dispense = normalize_references(dispense)
                normalize_medication_dispense_structure(dispense)
                resource_id = dispense.get('id', 'GEM-MedicationDispense')
                full_url = f"urn:uuid:{resource_id}"
                bundle["entry"].append(create_bundle_entry(dispense, full_url))
            
            if gem_medication:
                gem_medication = normalize_references(gem_medication)
                normalize_medication_structure(gem_medication)
                resource_id = gem_medication.get('id', 'GEM-Medication')
                full_url = f"urn:uuid:{resource_id}"
                bundle["entry"].append(create_bundle_entry(gem_medication, full_url))
    else:
        print(f"⚠ Warning: MedicationDispense_Parameters.json or MedicationDispense_Parameters.xml not found")
    
    # Add Task from XML
    task_xml_path = test_case_dir / "Task.xml"
    if task_xml_path.exists():
        print(f"✓ Processing Task.xml")
        # Parse XML and convert to JSON for the bundle
        task_json = convert_xml_to_json(task_xml_path)
        if task_json:
            resource_id = task_json.get('id', 'Task')
            full_url = f"urn:uuid:{resource_id}"
            bundle["entry"].append(create_bundle_entry(task_json, full_url))
    else:
        print(f"⚠ Warning: Task.xml not found")
    
    # Add VZDSearchSet from XML
    vzd_xml_path = test_case_dir / "VZDSearchSet.xml"
    if vzd_xml_path.exists():
        print(f"✓ Processing VZDSearchSet.xml")
        vzd_json = convert_xml_to_json(vzd_xml_path)
        if vzd_json:
            resource_id = vzd_json.get('id', 'VZD-SearchSet')
            full_url = f"urn:uuid:{resource_id}"
            bundle["entry"].append(create_bundle_entry(vzd_json, full_url))
    else:
        print(f"⚠ Warning: VZDSearchSet.xml not found")
    
    print(f"\n📦 Bundle created with {len(bundle['entry'])} entries")
    return bundle


def convert_xml_to_json(xml_path: Path) -> Dict[str, Any]:
    """Convert FHIR XML to JSON.

    Prefer Firely Terminal when the CLI is available for spec-compliant conversion
    and fall back to the lightweight XML walker otherwise (or when Firely declines
    to parse a specific file).
    """
    if FIRELY_CLI:
        converted = convert_xml_to_json_firely(xml_path)
        if converted:
            return converted
    return parse_fhir_xml_simple(xml_path)


def convert_xml_to_json_firely(xml_path: Path) -> Optional[Dict[str, Any]]:
    """Convert XML to JSON using Firely Terminal CLI if available."""
    try:
        with tempfile.TemporaryDirectory() as tmp_dir:
            subprocess.run(
                [FIRELY_CLI, "clear"],
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            push_result = subprocess.run(
                [FIRELY_CLI, "push", xml_path.name],
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                cwd=xml_path.parent,
            )
            if "Pushed 0" in (push_result.stdout or ""):
                print(f"  ✗ Firely CLI did not load resources from {xml_path.name}; falling back to internal parser")
                return None
            subprocess.run(
                [FIRELY_CLI, "save", "--all", "--json"],
                check=True,
                cwd=tmp_dir,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )

            json_files = sorted(Path(tmp_dir).glob("*.json"))
            if not json_files:
                print(f"  ✗ Firely CLI produced no output for {xml_path.name}")
                return None

            with open(json_files[0], "r", encoding="utf-8") as handle:
                data = json.load(handle)

            resource_type = data.get("resourceType", "Unknown")
            resource_id = data.get("id", "unknown")
            print(f"  → Parsed {resource_type} (id: {resource_id}) using Firely CLI")

            return data
    except subprocess.CalledProcessError as err:
        stderr = (err.stderr or "").strip()
        cmd = err.cmd
        if isinstance(cmd, (list, tuple)):
            cmd_repr = " ".join(str(part) for part in cmd)
        else:
            cmd_repr = str(cmd)
        print(f"  ✗ Firely CLI command failed ({cmd_repr}): {stderr}")
    except Exception as exc:
        print(f"  ✗ Firely CLI conversion error for {xml_path.name}: {exc}")

    return None


def parse_fhir_xml_simple(xml_path: Path) -> Dict[str, Any]:
    """Parse FHIR XML and convert to JSON-like dict structure."""
    import xml.etree.ElementTree as ET
    
    try:
        tree = ET.parse(xml_path)
        root = tree.getroot()
        
        # Remove namespace for easier parsing
        # FHIR namespace is http://hl7.org/fhir
        ns = {'fhir': 'http://hl7.org/fhir'}
        
        # Convert XML element to dict
        result = xml_element_to_dict(root, ns)
        
        resource_type = result.get('resourceType', 'Unknown')
        resource_id = result.get('id', 'unknown')
        print(f"  → Parsed {resource_type} (id: {resource_id}) using XML parser")
        
        return result
        
    except Exception as e:
        print(f"  ✗ Failed to parse XML: {e}")
        return {}


BOOLEAN_TAGS = {"active", "wasSubstituted", "valueBoolean"}

NUMERIC_VALUE_PARENTS = {
    "numerator",
    "denominator",
    "quantity",
    "doseQuantity",
    "rateQuantity",
    "expectedSupplyDuration",
    "valueQuantity",
    "low",
    "high",
}

DECIMAL_PATTERN = re.compile(r"^-?\d+(?:[\.,]\d+)?$")
INTEGER_PATTERN = re.compile(r"^-?\d+$")

FIRELY_CLI = shutil.which("fhir")


def convert_primitive_value(tag: str, value_attr: str, path: List[str]) -> Any:
    """Convert primitive FHIR XML values into JSON-native types."""
    value_lower = value_attr.lower()

    if tag in BOOLEAN_TAGS:
        return value_lower == "true"

    if tag in {"valueInteger", "valuePositiveInt", "valueUnsignedInt"}:
        return int(value_attr)

    if tag == "valueDecimal":
        normalized = value_attr.replace(",", ".")
        return float(normalized)

    if tag == "value":
        parent = path[-2] if len(path) >= 2 else ""
        if parent in NUMERIC_VALUE_PARENTS and DECIMAL_PATTERN.match(value_attr):
            normalized = value_attr.replace(",", ".")
            if "." in normalized:
                return float(normalized)
            if INTEGER_PATTERN.match(normalized):
                return int(normalized)
    
    if tag in {"count", "countMax", "frequency", "frequencyMax", "period", "periodMax", "duration", "durationMax", "offset", "total"}:
        if DECIMAL_PATTERN.match(value_attr):
            normalized = value_attr.replace(",", ".")
            if "." in normalized:
                return float(normalized)
            return int(normalized)

    return value_attr


def xml_element_to_dict(element, ns, path: Optional[List[str]] = None) -> Dict[str, Any]:
    """Recursively convert XML element to dictionary."""
    if path is None:
        path = []
    # Get tag name without namespace
    tag = element.tag.split('}')[-1] if '}' in element.tag else element.tag
    current_path = [*path, tag]
    
    # Base case: element with value attribute (FHIR pattern)
    value_attr = element.get('value')
    if value_attr is not None and len(element) == 0:
        return convert_primitive_value(tag, value_attr, current_path)
    
    # Special handling for 'resource' wrapper elements in Bundle entries
    # The actual resource is the first (and only) child
    if tag == 'resource' and len(element) == 1:
        # Return the parsed child resource directly
        return xml_element_to_dict(list(element)[0], ns, current_path)
    
    # Check if this is a FHIR resource (has xmlns or is capitalized)
    is_fhir_resource = (
        element.tag.startswith('{http://hl7.org/fhir}') or 
        (tag[0].isupper() if tag else False)
    )
    
    # Handle root resource type - add resourceType for all FHIR resources
    if is_fhir_resource and len(element) > 0:  # Has children, likely a resource
        # Common FHIR resource types
        resource_types = [
            'Bundle', 'Parameters', 'Task', 'MedicationRequest', 'Medication', 
            'MedicationDispense', 'Organization', 'Patient', 'Practitioner', 
            'Coverage', 'Composition', 'HealthcareService', 'PractitionerRole',
            'Location', 'Endpoint', 'Device', 'Observation', 'Condition',
            'Procedure', 'Immunization', 'AllergyIntolerance', 'CarePlan'
        ]
        
        if tag in resource_types or tag[0].isupper():
            result = {'resourceType': tag}
            
            # Get id attribute if present
            id_attr = element.get('id')
            if id_attr:
                result['id'] = id_attr
        else:
            result = {}
    else:
        result = {}
    
    # Special handling for extension elements - preserve the url attribute
    if tag == 'extension':
        url_attr = element.get('url')
        if url_attr:
            result['url'] = url_attr
    
    # Process child elements - GROUP BY TAG FIRST to handle arrays properly
    children_by_tag = {}
    for child in element:
        child_tag = child.tag.split('}')[-1] if '}' in child.tag else child.tag
        
        if child_tag not in children_by_tag:
            children_by_tag[child_tag] = []
        children_by_tag[child_tag].append(child)
    
    # Now convert each group
    for child_tag, child_elements in children_by_tag.items():
        # Special handling for fields that are always arrays in FHIR
        always_array_fields = ['line', 'given', 'prefix', 'suffix']
        
        if child_tag in always_array_fields:
            # Always create array for these fields, even with single element
            result[child_tag] = [xml_element_to_dict(child, ns, current_path) for child in child_elements]
        elif len(child_elements) == 1:
            # Single element - not an array
            result[child_tag] = xml_element_to_dict(child_elements[0], ns, current_path)
        else:
            # Multiple elements - create array
            result[child_tag] = [xml_element_to_dict(child, ns, current_path) for child in child_elements]
    
    # Special handling for common FHIR elements
    if 'id' in result and isinstance(result['id'], dict) and 'value' in result['id']:
        result['id'] = result['id']['value']
    elif 'id' in result and isinstance(result['id'], str):
        pass  # Already a string
    
    if 'meta' in result and isinstance(result['meta'], dict):
        meta = result['meta']
        if 'profile' in meta:
            profiles = meta['profile']
            if isinstance(profiles, dict) and 'value' in profiles:
                result['meta']['profile'] = [profiles['value']]
            elif isinstance(profiles, list):
                result['meta']['profile'] = [p.get('value', p) if isinstance(p, dict) else p for p in profiles]
            elif isinstance(profiles, str):
                result['meta']['profile'] = [profiles]
    
    # Handle entry arrays in Bundles
    if 'entry' in result:
        entries = result['entry']
        if not isinstance(entries, list):
            entries = [entries]
        
        # Process each entry
        processed_entries = []
        for entry in entries:
            if isinstance(entry, dict):
                # Extract fullUrl and resource
                processed_entry = {}
                if 'fullUrl' in entry:
                    fullUrl = entry['fullUrl']
                    if isinstance(fullUrl, dict) and 'value' in fullUrl:
                        processed_entry['fullUrl'] = fullUrl['value']
                    else:
                        processed_entry['fullUrl'] = fullUrl
                
                if 'resource' in entry:
                    processed_entry['resource'] = entry['resource']
                
                processed_entries.append(processed_entry)
        
        result['entry'] = processed_entries
    
    # Handle parameter arrays in Parameters
    if 'parameter' in result:
        params = result['parameter']
        if not isinstance(params, list):
            params = [params]
        result['parameter'] = params
    
    return result


def main():
    if len(sys.argv) != 3:
        print("Usage: python build-bundle.py <test-case-dir> <output-dir>")
        print("\nExample:")
        print("  python build-bundle.py test-cases/example-case-01 output/example-case-01")
        sys.exit(1)
    
    test_case_dir = Path(sys.argv[1])
    output_dir = Path(sys.argv[2])
    
    if not test_case_dir.exists():
        print(f"❌ Error: Test case directory not found: {test_case_dir}")
        sys.exit(1)
    
    if not test_case_dir.is_dir():
        print(f"❌ Error: {test_case_dir} is not a directory")
        sys.exit(1)
    
    # Get test case name from directory
    test_case_name = test_case_dir.name
    
    # Create output file path with naming convention
    output_file = output_dir / f"{test_case_name}-mapping-bundle.json"
    
    print(f"📁 Building mapping bundle from: {test_case_dir}")
    print(f"📄 Output: {output_file}\n")
    
    # Build the bundle
    bundle = build_mapping_bundle(test_case_dir)
    
    # Create output directory if needed
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Write the bundle
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(bundle, f, indent=2, ensure_ascii=False)
    
    print(f"\n✅ Mapping bundle created successfully: {output_file}")


if __name__ == "__main__":
    main()
