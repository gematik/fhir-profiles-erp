#!/usr/bin/env python3
"""
Extract individual resources from a FHIR Bundle

This helper script extracts individual resources from a Bundle (like the 
Mapping-Bundle.json) and saves them as separate JSON files in a test case directory.

Usage:
    python extract-from-bundle.py <bundle.json> <output-dir>
"""

import json
import sys
from pathlib import Path
from typing import Dict, Any


def extract_resources(bundle_path: Path, output_dir: Path):
    """Extract resources from bundle and save individually."""
    
    # Load bundle
    with open(bundle_path, 'r', encoding='utf-8') as f:
        bundle = json.load(f)
    
    if bundle.get('resourceType') != 'Bundle':
        print(f"❌ Error: File is not a Bundle, found: {bundle.get('resourceType')}")
        sys.exit(1)
    
    entries = bundle.get('entry', [])
    if not entries:
        print("⚠ Warning: Bundle contains no entries")
        return
    
    print(f"📦 Found {len(entries)} entries in bundle\n")
    
    # Create output directory
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # Track resource types for naming
    type_counters = {}
    
    for idx, entry in enumerate(entries):
        resource = entry.get('resource')
        if not resource:
            print(f"⚠ Entry {idx} has no resource, skipping")
            continue
        
        resource_type = resource.get('resourceType')
        resource_id = resource.get('id', f'unknown-{idx}')
        
        # Determine appropriate filename based on resource type and profile
        filename = get_filename_for_resource(resource, type_counters)
        
        # Save resource
        output_file = output_dir / filename
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(resource, f, indent=2, ensure_ascii=False)
        
        print(f"✓ Saved {resource_type}/{resource_id} → {filename}")


def get_filename_for_resource(resource: Dict[str, Any], counters: Dict[str, int]) -> str:
    """Determine appropriate filename for a resource."""
    
    resource_type = resource.get('resourceType')
    profiles = resource.get('meta', {}).get('profile', [])
    
    # Check profiles to determine specific type
    if resource_type == 'MedicationRequest':
        return 'KBV_Prescription.json'
    
    elif resource_type == 'Medication':
        # Determine medication type from profile
        for profile in profiles:
            if 'KBV_PR_ERP_Medication_PZN' in profile:
                return 'KBV_Medication_PZN.json'
            elif 'KBV_PR_ERP_Medication_Ingredient' in profile:
                return 'KBV_Medication_Ingredient.json'
            elif 'KBV_PR_ERP_Medication_Compounding' in profile:
                return 'KBV_Medication_Compounding.json'
            elif 'KBV_PR_ERP_Medication_FreeText' in profile:
                return 'KBV_Medication_FreeText.json'
            elif 'GEM_ERP_PR_Medication' in profile:
                # Check if we already have a GEM medication
                if 'GEM_Medication' not in counters:
                    counters['GEM_Medication'] = 0
                    return 'GEM_ERP_PR_Medication.json'
                else:
                    counters['GEM_Medication'] += 1
                    return f'GEM_Medication_{counters["GEM_Medication"]}.json'
        
        # Unknown medication type
        if 'Medication' not in counters:
            counters['Medication'] = 0
        else:
            counters['Medication'] += 1
        return f'Medication_{counters["Medication"]}.json'
    
    elif resource_type == 'MedicationDispense':
        return 'GEM_MedicationDispense.json'
    
    elif resource_type == 'Task':
        return 'Task.json'
    
    elif resource_type == 'Bundle':
        # Check if it's VZD SearchSet
        bundle_type = resource.get('type')
        if bundle_type == 'searchset':
            return 'VZDSearchSet.json'
        else:
            return f'Bundle_{bundle_type}.json'
    
    elif resource_type == 'Organization':
        return 'Organization.json'
    
    else:
        # Generic naming
        if resource_type not in counters:
            counters[resource_type] = 0
            return f'{resource_type}.json'
        else:
            counters[resource_type] += 1
            return f'{resource_type}_{counters[resource_type]}.json'


def main():
    if len(sys.argv) != 3:
        print("Usage: python extract-from-bundle.py <bundle.json> <output-dir>")
        print("\nExample:")
        print("  python extract-from-bundle.py ../../fsh-generated/resources/Bundle-Mapping-Bundle.json test-cases/example-case-01/")
        sys.exit(1)
    
    bundle_path = Path(sys.argv[1])
    output_dir = Path(sys.argv[2])
    
    if not bundle_path.exists():
        print(f"❌ Error: Bundle file not found: {bundle_path}")
        sys.exit(1)
    
    print(f"📁 Extracting resources from: {bundle_path}")
    print(f"📂 Output directory: {output_dir}\n")
    
    extract_resources(bundle_path, output_dir)
    
    print(f"\n✅ Extraction complete!")
    print(f"   Resources saved to: {output_dir}")


if __name__ == "__main__":
    main()
