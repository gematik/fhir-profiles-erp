#!/usr/bin/env python3
"""
Compare source and target resources from StructureMap transformation.

This script analyzes the mapping bundle (source) and digitaler durchschlag (target)
to show which fields were mapped and which were not.
"""

import json
import sys
import shutil
import re
from functools import lru_cache
from pathlib import Path
from typing import Dict, Any, List, Set, Tuple, Optional


def flatten_json(obj: Any, parent_key: str = '', sep: str = '.') -> Dict[str, Any]:
    """
    Flatten a nested JSON object into a flat dictionary with dot-separated keys.
    
    Args:
        obj: JSON object to flatten
        parent_key: Parent key for recursion
        sep: Separator for nested keys
    
    Returns:
        Flattened dictionary
    """
    items = {}
    
    if isinstance(obj, dict):
        for k, v in obj.items():
            new_key = f"{parent_key}{sep}{k}" if parent_key else k
            
            if isinstance(v, (dict, list)):
                items.update(flatten_json(v, new_key, sep=sep))
            else:
                items[new_key] = v
    elif isinstance(obj, list):
        for i, item in enumerate(obj):
            new_key = f"{parent_key}[{i}]"
            if isinstance(item, (dict, list)):
                items.update(flatten_json(item, new_key, sep=sep))
            else:
                items[new_key] = item
    else:
        items[parent_key] = obj
    
    return items


def get_resource_paths(resource: Dict[str, Any], prefix: str = '') -> Set[str]:
    """
    Get all field paths in a resource for coverage calculation.
    
    Args:
        resource: FHIR resource
        prefix: Prefix for nested paths
    
    Returns:
        Set of field paths
    """
    paths = set()
    flattened = flatten_json(resource, prefix)
    
    for path in flattened.keys():
        # Remove array indices for path comparison
        clean_path = path
        while '[' in clean_path and ']' in clean_path:
            start = clean_path.find('[')
            end = clean_path.find(']', start)
            if start != -1 and end != -1:
                clean_path = clean_path[:start] + clean_path[end+1:]
            else:
                break
        paths.add(clean_path)
    
    return paths


def copy_artifacts_to_includes(test_output_dir: Path, test_case_name: str, includes_dir: Path) -> Dict[str, Any]:
    """
    Copy test artifacts to the includes directory with proper naming.
    
    Args:
        test_output_dir: Test output directory containing the artifacts
        test_case_name: Name of the test case (e.g., 'example-case-01')
        includes_dir: Target includes directory
    
    Returns:
        Dictionary mapping artifact type to copied filename
    """
    artifacts = {}
    
    # Define source files
    mapping_bundle_src = test_output_dir / f"{test_case_name}-mapping-bundle.json"
    digitaler_durchschlag_src = test_output_dir / f"{test_case_name}-digitaler-durchschlag.json"

    # Determine content directory for downloadable artifacts
    content_dir = includes_dir.parent / "content" / "test-examples"
    content_dir.mkdir(parents=True, exist_ok=True)

    # Helper to copy file and return display/link info
    def copy_to_content(src: Path, target_name: str) -> Optional[Dict[str, str]]:
        if not src.exists():
            return None
        target_path = content_dir / target_name
        shutil.copy2(src, target_path)
        rel_path = f"test-examples/{target_name}"
        return {"display": target_name, "link": rel_path}

    # Copy generated files if they exist
    if mapping_bundle_src.exists():
        entry = copy_to_content(mapping_bundle_src, f"{test_case_name}-mapping-bundle.json")
        if entry:
            artifacts['mapping_bundle'] = entry
            print(f"📄 Copied mapping bundle: {entry['display']}")
    
    if digitaler_durchschlag_src.exists():
        entry = copy_to_content(digitaler_durchschlag_src, f"{test_case_name}-digitaler-durchschlag.json")
        if entry:
            artifacts['digitaler_durchschlag'] = entry
            print(f"📄 Copied digitaler durchschlag: {entry['display']}")
    
    # Copy source XML files from test case directory
    test_case_dir = Path(str(test_output_dir).replace('/output/', '/test-cases/'))
    if test_case_dir.exists():
        xml_files = list(test_case_dir.glob('*.xml'))
        artifacts['source_files'] = []
        
        for xml_file in xml_files:
            target_name = f"{test_case_name}-{xml_file.name}"
            entry = copy_to_content(xml_file, target_name)
            if entry:
                artifacts['source_files'].append(entry)
                print(f"📄 Copied source XML: {entry['display']}")
    
    return artifacts


def get_german_use_case_description(test_case_name: str) -> str:
    """
    Get German description for the test case.
    
    Args:
        test_case_name: Name of the test case
    
    Returns:
        German description of the use case
    """
    descriptions = {
        'example-case-01': 'Verschreibung und Abgabe eines PZN-Medikaments (Pomalidomid) mit spezifischer Dosierung und Transformation in einen digitalen Durchschlag.',
        'example-case-02': 'Verschreibung und Abgabe eines Wirkstoff-Medikaments (Lenalidomid) und nachfolgender Transformation in einen digitalen Durchschlag.',
        'example-case-03': 'Verschreibung und Abgabe eines Freitext-Medikaments und Transformation in einen digitalen Durchschlag.',
        'example-case-04': 'Verschreibung, Abgabe und Transformation einer Verordnung mit absoluten Referenzen in einen digitalen Durchschlag.'
    }
    
    return descriptions.get(test_case_name, f'Testfall für die Transformation von E-Rezept-Daten in einen digitalen Durchschlag ({test_case_name}).')


def create_enhanced_summary_section(test_case_name: str, artifacts: Dict[str, str]) -> List[str]:
    """
    Create enhanced summary section with German description and artifact references.
    
    Args:
        test_case_name: Name of the test case
        artifacts: Dictionary of copied artifacts
    
    Returns:
        List of markdown lines for the summary section
    """
    lines = []
    
    # Use case description in German
    use_case_desc = get_german_use_case_description(test_case_name)
    lines.append(f"**Anwendungsfall:** {use_case_desc}")
    lines.append("")
    
    # Artifact references
    if artifacts:
        lines.append("**Beispiel-Artefakte:**")
        
        # Source XML files
        if 'source_files' in artifacts and artifacts['source_files']:
            lines.append("- **Quell-Dateien:**")
            for source_file in artifacts['source_files']:
                lines.append(f"  - [`{source_file['display']}`]({source_file['link']})")
        
        # Generated artifacts
        if 'mapping_bundle' in artifacts:
            mapping_artifact = artifacts['mapping_bundle']
            lines.append(f"- **Mapping Bundle (generiert):** [`{mapping_artifact['display']}`]({mapping_artifact['link']})")
        if 'digitaler_durchschlag' in artifacts:
            dd_artifact = artifacts['digitaler_durchschlag']
            lines.append(f"- **Digitaler Durchschlag (Ergebnis):** [`{dd_artifact['display']}`]({dd_artifact['link']})")
        lines.append("")
    
    return lines


def normalize_path(path: str) -> str:
    """
    Remove array indices from path for comparison.
    Strips both [0], [1] etc. and [] to make all paths comparable.
    """
    import re
    # Remove [0], [1], etc. and also []
    normalized = re.sub(r'\[\d*\]', '', path)
    return normalized


def extract_extension_url(path: str, flat_data: Dict[str, Any]) -> Optional[str]:
    """
    Extract the URL from an extension field for semantic matching.
    Returns the extension URL if this is an extension field, None otherwise.
    """
    import re
    
    # Check if this is an extension field
    if not re.match(r'^extension\[', path):
        return None
    
    # Extract the base extension path (e.g., "extension[0]" from "extension[0].url")
    base_match = re.match(r'^(extension\[\d+\])', path)
    if not base_match:
        return None
    
    base_path = base_match.group(1)
    url_path = f"{base_path}.url"
    
    # Return the URL if it exists in the flattened data
    return flat_data.get(url_path)


def normalize_array_in_path(path: str, obj: Dict[str, Any]) -> str:
    """
    Normalize a path by detecting if intermediate keys contain arrays
    and adding [] where appropriate for consistent comparison.
    
    For example, if 'code.coding.code' actually represents 'code.coding[].code'
    because 'coding' is an array in the data.
    """
    import re
    parts = path.split('.')
    current_obj = obj
    normalized_parts = []
    
    for part in parts:
        # Check if part has array index already
        if '[' in part:
            normalized_parts.append(re.sub(r'\[\d+\]', '[]', part))
            # Navigate through the array
            base_part = part.split('[')[0]
            if isinstance(current_obj, dict) and base_part in current_obj:
                current_val = current_obj[base_part]
                if isinstance(current_val, list) and len(current_val) > 0:
                    current_obj = current_val[0]
        else:
            # Check if this field is actually an array in the object
            if isinstance(current_obj, dict) and part in current_obj:
                current_val = current_obj[part]
                if isinstance(current_val, list):
                    # This is an array, add [] to normalize
                    normalized_parts.append(f"{part}[]")
                    if len(current_val) > 0:
                        current_obj = current_val[0]
                else:
                    normalized_parts.append(part)
                    current_obj = current_val
            else:
                normalized_parts.append(part)
    
    return '.'.join(normalized_parts)


def canonicalize_extension_url(value: Any, alias_map: Optional[Dict[str, str]]) -> Optional[str]:
    """Return a canonical extension identifier using the alias map."""
    if not isinstance(value, str):
        return None
    value = value.strip()
    if alias_map:
        return alias_map.get(value, value)
    return value

def extract_url_from_condition(condition: Optional[str]) -> Optional[str]:
    """Extract url='...' fragments from StructureMap conditions."""
    if not condition:
        return None
    match = re.search(r"url\s*=\s*['\"]([^'\"]+)['\"]", condition)
    if match:
        return match.group(1)
    return None

def _target_url_values(target: Dict[str, Any]) -> List[str]:
    """Collect constant URL assignments from a StructureMap target entry."""
    if target.get('element') != 'url':
        return []
    values: List[str] = []
    for param in target.get('parameter', []):
        for key in ('valueString', 'valueUri', 'valueCanonical'):
            if key in param and isinstance(param[key], str):
                values.append(param[key])
    return values

def collect_aliases_from_rule(
    rule: Dict[str, Any],
    alias_map: Dict[str, str],
    inherited_sources: Optional[List[str]] = None,
) -> None:
    """Recursively record source->target extension URL mappings."""
    explicit_sources: List[str] = []
    for source in rule.get('source', []):
        url_value = extract_url_from_condition(source.get('condition'))
        if url_value:
            explicit_sources.append(url_value)

    active_sources = explicit_sources if explicit_sources else (inherited_sources or [])

    target_urls: List[str] = []
    for target in rule.get('target', []):
        target_urls.extend(_target_url_values(target))

    for src_url in active_sources:
        for tgt_url in target_urls:
            alias_map.setdefault(src_url, tgt_url)

    next_inherited = active_sources if active_sources else inherited_sources

    for child_rule in rule.get('rule', []):
        collect_aliases_from_rule(child_rule, alias_map, next_inherited)

def collect_aliases_from_structuremap(structuremap: Dict[str, Any], alias_map: Dict[str, str]) -> None:
    for group in structuremap.get('group', []):
        for rule in group.get('rule', []):
            collect_aliases_from_rule(rule, alias_map)

@lru_cache(maxsize=1)
def load_extension_alias_map() -> Dict[str, str]:
    """Load alias mappings from all generated StructureMap resources."""
    alias_map: Dict[str, str] = {}
    script_dir = Path(__file__).parent
    project_root = script_dir.parent.parent
    structuremap_dir = project_root / "fsh-generated" / "resources"

    if not structuremap_dir.exists():
        return alias_map

    for sm_path in structuremap_dir.glob("StructureMap-*.json"):
        try:
            with sm_path.open('r', encoding='utf-8') as handle:
                sm = json.load(handle)
        except (OSError, json.JSONDecodeError):
            continue
        collect_aliases_from_structuremap(sm, alias_map)

    return alias_map


def extract_resources_from_bundle(bundle: Dict[str, Any]) -> Tuple[Dict[str, Dict[str, Any]], Dict[str, str]]:
    """
    Extract all resources from a Bundle.
    
    For VZD SearchSet bundles, creates a composite resource that merges all
    contained resources (Organization, HealthcareService, Location) into one
    since they map to a single target Organization.
    
    Returns:
        Tuple of:
        - Dictionary mapping resource type to list of resources
        - Dictionary mapping medication IDs to their context ('prescription' or 'dispensation')
    """
    resources = {}
    medication_contexts = {}
    
    if bundle.get('resourceType') == 'Bundle' and 'entry' in bundle:
        for entry in bundle['entry']:
            if 'resource' in entry:
                resource = entry['resource']
                resource_type = resource.get('resourceType', 'Unknown')
                resource_id = resource.get('id', 'no-id')
                
                # Track medication references from MedicationRequest
                if resource_type == 'MedicationRequest':
                    med_ref = resource.get('medicationReference', {}).get('reference', '')
                    if med_ref:
                        # Extract medication ID from reference (handle urn:uuid: format)
                        if 'urn:uuid:' in med_ref:
                            med_id = med_ref.split('urn:uuid:')[-1]
                        else:
                            med_id = med_ref.split('/')[-1]
                        medication_contexts[med_id] = 'prescription'
                
                # Track medication references from MedicationDispense
                elif resource_type == 'MedicationDispense':
                    med_ref = resource.get('medicationReference', {}).get('reference', '')
                    if med_ref:
                        # Extract medication ID from reference (handle urn:uuid: format)
                        if 'urn:uuid:' in med_ref:
                            med_id = med_ref.split('urn:uuid:')[-1]
                        else:
                            med_id = med_ref.split('/')[-1]
                        medication_contexts[med_id] = 'dispensation'
                
                # Check if this is a VZD SearchSet Bundle (nested bundle)
                if resource_type == 'Bundle' and resource.get('type') == 'searchset' and 'VZD' in resource_id:
                    # Create a composite resource merging all VZD entries
                    composite = {
                        'resourceType': 'VZDComposite',
                        'id': resource_id,
                        'sourceResources': []
                    }
                    
                    for vzd_entry in resource.get('entry', []):
                        if 'resource' in vzd_entry:
                            vzd_resource = vzd_entry['resource']
                            vzd_type = vzd_resource.get('resourceType', 'Unknown')
                            composite['sourceResources'].append(vzd_type)
                            
                            # Merge fields from each resource type into the composite
                            # Organization -> direct fields
                            # HealthcareService -> telecom
                            # Location -> address
                            if vzd_type == 'Organization':
                                composite['name'] = vzd_resource.get('name')
                                composite['identifier'] = vzd_resource.get('identifier', [])
                            elif vzd_type == 'HealthcareService':
                                composite['telecom'] = vzd_resource.get('telecom', [])
                            elif vzd_type == 'Location':
                                composite['address'] = vzd_resource.get('address', [])
                    
                    resources[f"VZDComposite/{resource_id}"] = composite
                else:
                    # Regular resource
                    key = f"{resource_type}/{resource_id}"
                    resources[key] = resource
    
    return resources, medication_contexts


def extract_resources_from_parameters(params: Dict[str, Any]) -> Dict[str, Dict[str, Any]]:
    """
    Extract all resources from Parameters (digitaler durchschlag).
    
    Returns:
        Dictionary mapping resource type/context to resources
    """
    resources: Dict[str, Dict[str, Any]] = {}
    references_to_resolve: List[Tuple[str, str, str]] = []
    resources_by_type_id: Dict[Tuple[str, str], Dict[str, Any]] = {}
    resources_by_id: Dict[str, Dict[str, Any]] = {}
    
    if params.get('resourceType') != 'Parameters':
        return resources
    
    def process_parts(parts: List[Dict[str, Any]], param_name: str, parent_path: str = "") -> None:
        for index, part in enumerate(parts):
            part_name = part.get('name', f'unnamed[{index}]')
            current_path = f"{parent_path}.{part_name}" if parent_path else part_name

            if 'resource' in part:
                resource = part['resource']
                resource_type = resource.get('resourceType', 'Unknown')
                key = f"{param_name}.{current_path}:{resource_type}"
                resources[key] = resource

                resource_id = resource.get('id')
                if resource_id:
                    resources_by_type_id[(resource_type, resource_id)] = resource
                    resources_by_id.setdefault(resource_id, resource)

            if 'valueReference' in part:
                ref = part['valueReference'].get('reference')
                if ref:
                    references_to_resolve.append((param_name, current_path, ref))

            if 'part' in part:
                process_parts(part['part'], param_name, current_path)

    for param in params.get('parameter', []):
        param_name = param.get('name', '')

        if 'resource' in param:
            resource = param['resource']
            resource_type = resource.get('resourceType', 'Unknown')
            key = f"{param_name}:{resource_type}"
            resources[key] = resource
            resource_id = resource.get('id')
            if resource_id:
                resources_by_type_id[(resource_type, resource_id)] = resource
                resources_by_id.setdefault(resource_id, resource)

        if 'part' in param:
            process_parts(param['part'], param_name)

    # Resolve valueReference parts to existing resources when possible
    for param_name, part_name, reference in references_to_resolve:
        ref_type = None
        ref_id = reference
        if reference.startswith('urn:uuid:'):
            ref_id = reference.split('urn:uuid:')[-1]
        elif '/' in reference:
            parts = reference.split('/')
            if len(parts) >= 2:
                ref_type = parts[-2]
                ref_id = parts[-1]
            else:
                ref_id = parts[-1]

        resolved_resource = None
        resolved_type = ref_type

        if ref_type and (ref_type, ref_id) in resources_by_type_id:
            resolved_resource = resources_by_type_id[(ref_type, ref_id)]
        elif ref_id in resources_by_id:
            resolved_resource = resources_by_id[ref_id]
            resolved_type = resolved_resource.get('resourceType', ref_type or 'Unknown')

        if resolved_resource and resolved_type:
            key = f"{param_name}.{part_name}:{resolved_type}"
            # Only add if this specific part hasn't already been captured as a resource
            resources.setdefault(key, resolved_resource)
    
    return resources


def get_field_value(obj: Dict[str, Any], path: str) -> Any:
    """
    Get value at a specific field path.
    
    Args:
        obj: Object to search
        path: Dot-notation path (with [] for arrays)
    
    Returns:
        Value at path, or None if not found
    """
    import re
    
    parts = re.split(r'\.|\[|\]', path)
    parts = [p for p in parts if p]  # Remove empty strings
    
    current = obj
    for part in parts:
        if current is None:
            return None
        
        if isinstance(current, dict):
            current = current.get(part)
        elif isinstance(current, list):
            try:
                idx = int(part)
                current = current[idx] if idx < len(current) else None
            except (ValueError, IndexError):
                return None
        else:
            return None
    
    return current


def format_value(value: Any, max_length: int = 50) -> str:
    """Format a value for display in table."""
    if value is None:
        return "-"
    
    if isinstance(value, bool):
        return "true" if value else "false"
    
    if isinstance(value, (int, float)):
        return str(value)
    
    if isinstance(value, str):
        if len(value) > max_length:
            return value[:max_length-3] + "..."
        return value
    
    if isinstance(value, (dict, list)):
        s = json.dumps(value, ensure_ascii=False)
        if len(s) > max_length:
            return s[:max_length-3] + "..."
        return s
    
    return str(value)


def compare_resources_with_values(
    source: Dict[str, Any],
    target: Dict[str, Any],
    alias_map: Optional[Dict[str, str]] = None,
) -> List[Dict[str, Any]]:
    """
    Compare two resources and return field mapping with values.
    Enhanced to handle extensions semantically by matching them by URL.
    
    Returns:
        List of dictionaries with field mappings and values
    """
    alias_map = alias_map or {}

    source_flat = flatten_json(source)
    target_flat = flatten_json(target)
    
    # Remove resourceType and meta fields
    exclude_patterns = ['resourceType', 'meta.profile', 'meta.lastUpdated', 'meta.versionId']
    source_flat = {k: v for k, v in source_flat.items() if not any(k.startswith(e) for e in exclude_patterns)}
    target_flat = {k: v for k, v in target_flat.items() if not any(k.startswith(e) for e in exclude_patterns)}
    
    # Separate extension fields from other fields
    source_ext = {k: v for k, v in source_flat.items() if k.startswith('extension[')}
    source_non_ext = {k: v for k, v in source_flat.items() if not k.startswith('extension[')}
    target_ext = {k: v for k, v in target_flat.items() if k.startswith('extension[')}
    target_non_ext = {k: v for k, v in target_flat.items() if not k.startswith('extension[')}
    
    # Handle non-extension fields with the original normalization logic
    source_normalized = {normalize_path(k): (k, v) for k, v in source_non_ext.items()}
    target_normalized = {normalize_path(k): (k, v) for k, v in target_non_ext.items()}
    
    # Build comparison table
    comparisons = []
    
    # Process non-extension fields
    for norm_path, (src_path, src_value) in sorted(source_normalized.items()):
        if norm_path in target_normalized:
            tgt_path, tgt_value = target_normalized[norm_path]
            comparisons.append({
                'source_path': src_path,
                'source_value': src_value,
                'target_path': tgt_path,
                'target_value': tgt_value,
                'status': 'mapped'
            })
        else:
            comparisons.append({
                'source_path': src_path,
                'source_value': src_value,
                'target_path': '-',
                'target_value': None,
                'status': 'unmapped'
            })
    
    # Add target-only non-extension fields (newly created)
    for norm_path, (tgt_path, tgt_value) in sorted(target_normalized.items()):
        if norm_path not in source_normalized:
            comparisons.append({
                'source_path': '-',
                'source_value': None,
                'target_path': tgt_path,
                'target_value': tgt_value,
                'status': 'new'
            })
    
    # Handle extension fields semantically
    # Group extensions by their base path (extension[0], extension[1], etc.)
    import re
    
    source_extensions = {}
    target_extensions = {}
    
    # Group source extensions by their index
    for path, value in source_ext.items():
        match = re.match(r'^extension\[(\d+)\](.*)$', path)
        if match:
            ext_idx = int(match.group(1))
            sub_path = match.group(2)
            if ext_idx not in source_extensions:
                source_extensions[ext_idx] = {}
            source_extensions[ext_idx][sub_path] = value
    
    # Group target extensions by their index
    for path, value in target_ext.items():
        match = re.match(r'^extension\[(\d+)\](.*)$', path)
        if match:
            ext_idx = int(match.group(1))
            sub_path = match.group(2)
            if ext_idx not in target_extensions:
                target_extensions[ext_idx] = {}
            target_extensions[ext_idx][sub_path] = value
    
    # Build URL to extension mapping for semantic matching
    source_url_to_ext = {}
    target_url_to_ext = {}
    
    for ext_idx, ext_data in source_extensions.items():
        if '.url' in ext_data:
            url = canonicalize_extension_url(ext_data['.url'], alias_map)
            if url:
                source_url_to_ext[url] = (ext_idx, ext_data)
    
    for ext_idx, ext_data in target_extensions.items():
        if '.url' in ext_data:
            url = canonicalize_extension_url(ext_data['.url'], alias_map)
            if url:
                target_url_to_ext[url] = (ext_idx, ext_data)
    
    # Match extensions by URL and add their individual fields
    matched_source_urls = set()
    matched_target_urls = set()
    
    for src_url, (src_idx, src_ext_data) in source_url_to_ext.items():
        if src_url in target_url_to_ext:
            tgt_idx, tgt_ext_data = target_url_to_ext[src_url]
            matched_source_urls.add(src_url)
            matched_target_urls.add(src_url)
            
            # Compare individual fields within this extension
            # For extension fields, we need to match them by their exact structure
            # not by normalized paths, since we want to preserve nested extension matching
            src_paths = {subpath: (f"extension[{src_idx}]{subpath}", value) 
                        for subpath, value in src_ext_data.items()}
            tgt_paths = {subpath: (f"extension[{tgt_idx}]{subpath}", value) 
                        for subpath, value in tgt_ext_data.items()}
            
            # For nested extensions, we need special handling
            # Group by normalized path but preserve exact matching within the same semantic extension
            
            # Create mapping for nested extensions within this extension by their URL
            src_nested_by_url = {}
            tgt_nested_by_url = {}
            
            # Extract nested extension URLs
            
            for subpath, value in src_ext_data.items():
                if subpath.startswith('.extension[') and subpath.endswith('.url'):
                    # This is a nested extension URL, e.g., .extension[0].url
                    nested_match = re.match(r'\.extension\[(\d+)\]\.url', subpath)
                    if nested_match:
                        nested_idx = int(nested_match.group(1))
                        canonical_url = canonicalize_extension_url(value, alias_map)
                        if canonical_url:
                            src_nested_by_url[canonical_url] = nested_idx
            
            for subpath, value in tgt_ext_data.items():
                if subpath.startswith('.extension[') and subpath.endswith('.url'):
                    nested_match = re.match(r'\.extension\[(\d+)\]\.url', subpath)
                    if nested_match:
                        nested_idx = int(nested_match.group(1))
                        canonical_url = canonicalize_extension_url(value, alias_map)
                        if canonical_url:
                            tgt_nested_by_url[canonical_url] = nested_idx
            
            # Match nested extensions by URL and then compare their fields
            matched_nested_urls = set()
            
            for nested_url, src_nested_idx in src_nested_by_url.items():
                if nested_url in tgt_nested_by_url:
                    tgt_nested_idx = tgt_nested_by_url[nested_url]
                    matched_nested_urls.add(nested_url)
                    
                    # Compare all fields of this nested extension
                    src_nested_prefix = f'.extension[{src_nested_idx}]'
                    tgt_nested_prefix = f'.extension[{tgt_nested_idx}]'
                    
                    # Find all fields belonging to this nested extension
                    src_nested_fields = {k: v for k, v in src_ext_data.items() 
                                        if k.startswith(src_nested_prefix)}
                    tgt_nested_fields = {k: v for k, v in tgt_ext_data.items() 
                                        if k.startswith(tgt_nested_prefix)}
                    
                    # Map source nested fields to target nested fields
                    for src_field_path, src_field_value in src_nested_fields.items():
                        # Convert source path to target path by replacing indices
                        corresponding_tgt_path = src_field_path.replace(
                            src_nested_prefix, tgt_nested_prefix)
                        
                        if corresponding_tgt_path in tgt_nested_fields:
                            tgt_field_value = tgt_nested_fields[corresponding_tgt_path]
                            comparisons.append({
                                'source_path': f"extension[{src_idx}]{src_field_path}",
                                'source_value': src_field_value,
                                'target_path': f"extension[{tgt_idx}]{corresponding_tgt_path}",
                                'target_value': tgt_field_value,
                                'status': 'mapped'
                            })
                        else:
                            comparisons.append({
                                'source_path': f"extension[{src_idx}]{src_field_path}",
                                'source_value': src_field_value,
                                'target_path': '-',
                                'target_value': None,
                                'status': 'unmapped'
                            })
                    
                    # Add any target-only fields for this nested extension
                    for tgt_field_path, tgt_field_value in tgt_nested_fields.items():
                        corresponding_src_path = tgt_field_path.replace(
                            tgt_nested_prefix, src_nested_prefix)
                        if corresponding_src_path not in src_nested_fields:
                            comparisons.append({
                                'source_path': '-',
                                'source_value': None,
                                'target_path': f"extension[{tgt_idx}]{tgt_field_path}",
                                'target_value': tgt_field_value,
                                'status': 'new'
                            })
            
            # Handle unmatched nested extensions from source
            for nested_url, src_nested_idx in src_nested_by_url.items():
                if nested_url not in matched_nested_urls:
                    src_nested_prefix = f'.extension[{src_nested_idx}]'
                    src_nested_fields = {k: v for k, v in src_ext_data.items() 
                                        if k.startswith(src_nested_prefix)}
                    for src_field_path, src_field_value in src_nested_fields.items():
                        comparisons.append({
                            'source_path': f"extension[{src_idx}]{src_field_path}",
                            'source_value': src_field_value,
                            'target_path': '-',
                            'target_value': None,
                            'status': 'unmapped'
                        })
            
            # Handle unmatched nested extensions from target
            for nested_url, tgt_nested_idx in tgt_nested_by_url.items():
                if nested_url not in matched_nested_urls:
                    tgt_nested_prefix = f'.extension[{tgt_nested_idx}]'
                    tgt_nested_fields = {k: v for k, v in tgt_ext_data.items() 
                                        if k.startswith(tgt_nested_prefix)}
                    for tgt_field_path, tgt_field_value in tgt_nested_fields.items():
                        comparisons.append({
                            'source_path': '-',
                            'source_value': None,
                            'target_path': f"extension[{tgt_idx}]{tgt_field_path}",
                            'target_value': tgt_field_value,
                            'status': 'new'
                        })
            
            # Handle non-nested fields within this extension (direct properties)
            for subpath, (src_full_path, src_value) in sorted(src_paths.items()):
                # Skip nested extension fields (already handled above)
                if not subpath.startswith('.extension['):
                    if subpath in tgt_paths:
                        tgt_full_path, tgt_value = tgt_paths[subpath]
                        comparisons.append({
                            'source_path': src_full_path,
                            'source_value': src_value,
                            'target_path': tgt_full_path,
                            'target_value': tgt_value,
                            'status': 'mapped'
                        })
                    else:
                        comparisons.append({
                            'source_path': src_full_path,
                            'source_value': src_value,
                            'target_path': '-',
                            'target_value': None,
                            'status': 'unmapped'
                        })
            
            # Add target-only non-nested fields
            for subpath, (tgt_full_path, tgt_value) in sorted(tgt_paths.items()):
                if not subpath.startswith('.extension[') and subpath not in src_paths:
                    comparisons.append({
                        'source_path': '-',
                        'source_value': None,
                        'target_path': tgt_full_path,
                        'target_value': tgt_value,
                        'status': 'new'
                    })
        else:
            # Unmatched source extension - all its fields are unmapped
            for subpath, value in src_ext_data.items():
                comparisons.append({
                    'source_path': f"extension[{src_idx}]{subpath}",
                    'source_value': value,
                    'target_path': '-',
                    'target_value': None,
                    'status': 'unmapped'
                })
    
    # Add completely unmatched target extensions (new)
    for tgt_url, (tgt_idx, tgt_ext_data) in target_url_to_ext.items():
        if tgt_url not in matched_target_urls:
            for subpath, value in tgt_ext_data.items():
                comparisons.append({
                    'source_path': '-',
                    'source_value': None,
                    'target_path': f"extension[{tgt_idx}]{subpath}",
                    'target_value': value,
                    'status': 'new'
                })
    
    return comparisons


def generate_markdown_report(test_case_dir: Path, output_file: Path) -> None:
    """
    Generate a markdown comparison report.
    
    Args:
        test_case_dir: Directory containing test case
        output_file: Where to write the markdown report
    """
    test_case_name = test_case_dir.name
    
    # Load source mapping bundle
    mapping_bundle_path = test_case_dir / f"{test_case_name}-mapping-bundle.json"
    if not mapping_bundle_path.exists():
        print(f"❌ Mapping bundle not found: {mapping_bundle_path}")
        sys.exit(1)
    
    with open(mapping_bundle_path, 'r') as f:
        mapping_bundle = json.load(f)
    
    # Load target digitaler durchschlag
    dd_path = test_case_dir / f"{test_case_name}-digitaler-durchschlag.json"
    if not dd_path.exists():
        print(f"❌ Digitaler Durchschlag not found: {dd_path}")
        sys.exit(1)
    
    with open(dd_path, 'r') as f:
        digitaler_durchschlag = json.load(f)
    
    # Extract resources and medication contexts
    source_resources, medication_contexts = extract_resources_from_bundle(mapping_bundle)
    target_resources = extract_resources_from_parameters(digitaler_durchschlag)
    alias_map = load_extension_alias_map()
    
    # Copy artifacts to includes directory (if output file is in includes)
    artifacts = {}
    if 'input/includes' in str(output_file):
        includes_dir = output_file.parent
        artifacts = copy_artifacts_to_includes(test_case_dir, test_case_name, includes_dir)
    
    # Generate report
    md = []
    md.append(f"# StructureMap Transformation Report")
    md.append(f"")
    md.append(f"")
    md.append(f"## Summary")
    md.append(f"")
    
    # Add enhanced summary with German description and artifact links
    summary_lines = create_enhanced_summary_section(test_case_name, artifacts)
    md.extend(summary_lines)
    md.append(f"")
    
    # Overall statistics
    total_source_fields = 0
    total_mapped_fields = 0
    total_unmapped_fields = 0
    total_new_fields = 0
    
    md.append(f"## Resource Mapping Details")
    md.append(f"")
    
    # Group source resources by type
    source_by_type = {}
    for key, resource in source_resources.items():
        resource_type = resource.get('resourceType', 'Unknown')
        if resource_type not in source_by_type:
            source_by_type[resource_type] = []
        source_by_type[resource_type].append((key, resource))
    
    # Analyze each source resource type
    for resource_type, resources in sorted(source_by_type.items()):
        # Skip Task resources
        if resource_type == 'Task':
            continue
            
        md.append(f"### {resource_type}")
        md.append(f"")
        
        for source_key, source_resource in resources:
            source_id = source_resource.get('id', 'no-id')
            md.append(f"#### Source: `{source_key}`")
            md.append(f"")
            
            # Find all corresponding targets (not just best match)
            matches = []
            
            for target_key, target_resource in target_resources.items():
                # Derive parameter and part names from the composite key (e.g. rxPrescription.medication:Medication)
                target_param = ''
                target_part = ''
                target_declared_type = ''

                if ':' in target_key:
                    prefix, target_declared_type = target_key.split(':', 1)
                else:
                    prefix = target_key
                if '.' in prefix:
                    target_param, target_part = prefix.split('.', 1)
                else:
                    target_param = prefix

                target_type = target_resource.get('resourceType', target_declared_type or 'Unknown')

                # Special handling for VZDComposite -> Organization mapping
                if resource_type == 'VZDComposite' and target_type == 'Organization':
                    comparisons = compare_resources_with_values(
                        source_resource, target_resource, alias_map
                    )
                    mapped_count = sum(1 for c in comparisons if c['status'] == 'mapped')
                    total_source = sum(1 for c in comparisons if c['status'] in ['mapped', 'unmapped'])
                    score = mapped_count / total_source if total_source > 0 else 0
                    if score > 0:
                        matches.append((target_key, target_resource, comparisons))
                    continue

                # Special handling for Medication matching based on context
                if resource_type == 'Medication':
                    target_part_tail = target_part.split('.')[-1] if target_part else ''
                    if target_type != 'Medication' or target_part_tail != 'medication':
                        continue

                    med_context = medication_contexts.get(source_id, 'unknown')
                    context_matches = False
                    if target_param == 'rxPrescription' and med_context == 'prescription':
                        context_matches = True
                    elif target_param == 'rxDispensation' and med_context == 'dispensation':
                        context_matches = True

                    if not context_matches:
                        continue

                    comparisons = compare_resources_with_values(
                        source_resource, target_resource, alias_map
                    )
                    mapped_count = sum(1 for c in comparisons if c['status'] == 'mapped')
                    total_source = sum(1 for c in comparisons if c['status'] in ['mapped', 'unmapped'])
                    score = mapped_count / total_source if total_source > 0 else 0
                    if score > 0:
                        matches.append((target_key, target_resource, comparisons))
                    continue

                # Normal matching for other resources (matching on resource type)
                if resource_type != 'Medication' and target_type == resource_type:
                    comparisons = compare_resources_with_values(
                        source_resource, target_resource, alias_map
                    )
                    mapped_count = sum(1 for c in comparisons if c['status'] == 'mapped')
                    total_source = sum(1 for c in comparisons if c['status'] in ['mapped', 'unmapped'])
                    score = mapped_count / total_source if total_source > 0 else 0
                    if score > 0:
                        matches.append((target_key, target_resource, comparisons))
            
            # Output all matches
            if matches:
                for target_key, target_resource, comparisons in matches:
                    mapped = [c for c in comparisons if c['status'] == 'mapped']
                    unmapped = [c for c in comparisons if c['status'] == 'unmapped']
                    new_fields = [c for c in comparisons if c['status'] == 'new']
                    
                    total_source_fields += len(mapped) + len(unmapped)
                    total_mapped_fields += len(mapped)
                    total_unmapped_fields += len(unmapped)
                    total_new_fields += len(new_fields)
                    
                    target_type = target_resource.get('resourceType', 'Unknown')
                    
                    md.append(f"**Target:** `{target_key}` (`{target_type}`)  ")
                    md.append(f"")
                    
                    # Create value comparison table
                    md.append(f"| Source Field | Source Value | Target Field | Target Value | Status |")
                    md.append(f"|--------------|--------------|--------------|--------------|--------|")
                    
                    # First show mapped fields
                    for comp in sorted(mapped, key=lambda x: x['source_path']):
                        src_val = format_value(comp['source_value'])
                        tgt_val = format_value(comp['target_value'])
                        md.append(f"| `{comp['source_path']}` | {src_val} | `{comp['target_path']}` | {tgt_val} | ✅ |")
                    
                    # Then unmapped fields
                    for comp in sorted(unmapped, key=lambda x: x['source_path']):
                        src_val = format_value(comp['source_value'])
                        md.append(f"| `{comp['source_path']}` | {src_val} | - | - | ⚠️ |")
                    
                    # Finally new fields
                    if new_fields:
                        md.append(f"")
                        md.append(f"**New fields created by transformation:**")
                        md.append(f"")
                        md.append(f"| Target Field | Target Value | Status |")
                        md.append(f"|--------------|--------------|--------|")
                        for comp in sorted(new_fields, key=lambda x: x['target_path']):
                            tgt_val = format_value(comp['target_value'])
                            md.append(f"| `{comp['target_path']}` | {tgt_val} | 🆕 |")
                    
                    md.append(f"")
            else:
                md.append(f"**Target:** ❌ No matching target resource found")
                md.append(f"")
                # Count source fields as unmapped
                source_flat = flatten_json(source_resource)
                total_source_fields += len(source_flat)
                total_unmapped_fields += len(source_flat)
            
            md.append(f"---")
            md.append(f"")
    
    # Write report
    with open(output_file, 'w') as f:
        f.write('\n'.join(md))
    
    print(f"📊 Comparison report generated: {output_file}")
    print(f"")
    print(f"Summary:")
    print(f"  • Source fields: {total_source_fields}")
    print(f"  • Mapped: {total_mapped_fields} ({total_mapped_fields/total_source_fields*100:.1f}%)" if total_source_fields > 0 else "  • Mapped: 0")
    print(f"  • Unmapped: {total_unmapped_fields}")
    print(f"  • New fields created: {total_new_fields}")


def main():
    if len(sys.argv) != 3:
        print("Usage: python compare-mapping.py <test-output-dir> <report-output-file>")
        print("\nExample:")
        print("  python compare-mapping.py tests/output/example-case-01 tests/output/example-case-01/mapping-report.md")
        sys.exit(1)
    
    test_output_dir = Path(sys.argv[1])
    report_file = Path(sys.argv[2])
    
    if not test_output_dir.exists():
        print(f"❌ Error: Test output directory not found: {test_output_dir}")
        sys.exit(1)
    
    print(f"📊 Generating mapping comparison report...")
    print(f"   Source: {test_output_dir}")
    print(f"   Report: {report_file}\n")
    
    generate_markdown_report(test_output_dir, report_file)


if __name__ == "__main__":
    main()
