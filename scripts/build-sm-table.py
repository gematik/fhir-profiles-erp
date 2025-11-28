import sys
import json
import re

def clean_path(path):
    """Clean up FHIR paths to be more readable"""
    if not path:
        return ""
    
    # Remove variable names (anything with 'Var' in it)
    path = re.sub(r'\.[a-zA-Z]*Var(?:\.[a-zA-Z]*Var)*', '', path)
    
    # Remove redundant bundle.bundle prefixes
    path = re.sub(r'^bundle\.bundle\.', '', path)
    path = re.sub(r'\.bundle\.', '.', path)
    
    # Simplify common patterns
    path = re.sub(r'entry\.resource\s*\[where\s+ofType\((\w+)\)\]', r'entry[\1]', path)
    path = re.sub(r'entry\.resource\s*\[where\s+resource\.ofType\((\w+)\)\]', r'entry[\1]', path)
    
    # Clean up complex medication references
    medication_pattern = r'entry\s*\[where\s+resource\.ofType\(Medication\)\.where\(id=%\w+\.resource\.medication\.reference\.replace\(\'Medication/\',\s*\'\'\)\.toString\(\)\)\]'
    path = re.sub(medication_pattern, 'entry[referenced Medication]', path)
    
    return path

def format_target_path(path):
    """Format target paths to be more descriptive"""
    if not path:
        return ""
    
    # Remove variable names from target paths too
    path = re.sub(r'\.[a-zA-Z]*Var(?:\.[a-zA-Z]*Var)*', '', path)
    
    # Map common target patterns to more readable names
    mappings = {
        'erpTCarbonCopy.meta.erpTCarbonCopyMeta.profile': 'CarbonCopy.meta.profile',
        'erpTCarbonCopy.parameter': 'CarbonCopy.parameter',
        'name': 'parameter.name',
        'name.resource': 'parameter.resource',
        'resource': 'parameter.resource',
        'part.name': 'parameter.part.name'
    }
    
    for pattern, replacement in mappings.items():
        if path == pattern:
            return replacement
    
    return path

def is_generic_source(path):
    """Check if source path is too generic to be meaningful"""
    if not path:
        return True
    
    # These are considered too generic/not informative
    generic_patterns = [
        'bundle',
        'bundle.bundle',
        ''
    ]
    
    return path.strip() in generic_patterns

def has_meaningful_transformation(rule):
    """Check if rule has a meaningful transformation (not just a simple copy)"""
    # Check for URL transformations (these are meaningful)
    if 'target' in rule and rule['target']:
        for target in rule['target']:
            if target.get('transform') == 'copy' and 'parameter' in target:
                for param in target['parameter']:
                    if 'valueString' in param:
                        value = param['valueString']
                        # URL transformations are meaningful
                        if 'http' in value or 'StructureDefinition' in value:
                            return True
            elif target.get('transform') == 'create':
                return True
    
    # Check for dependent mappings (these are meaningful)
    if 'dependent' in rule:
        return True
    
    # Check for conditions (these add logic)
    if 'source' in rule and rule['source']:
        for source in rule['source']:
            if source.get('condition'):
                return True
    
    # Check for documentation that indicates transformation
    doc = rule.get('documentation', '')
    if doc and not doc.lower().startswith('copies'):
        return True
    
    return False

def extract_target_transformation_info(target):
    """Extract transformation hints for a specific target mapping."""
    if not target:
        return []

    transformations = []
    transform_type = target.get('transform')
    parameters = target.get('parameter', [])

    if transform_type == 'copy':
        for param in parameters:
            value = param.get('valueString')
            if value:
                if 'http' in value or 'StructureDefinition' in value:
                    transformations.append(f"→ setzt URL '{value}'")
                else:
                    transformations.append(f"→ setzt Wert '{value}'")
            elif 'valueId' in param:
                transformations.append("→ übernimmt Wert aus Quellvariable")
            elif 'valueBoolean' in param:
                transformations.append(f"→ setzt Wert '{param['valueBoolean']}'")
    elif transform_type == 'create':
        for param in parameters:
            value = param.get('valueString')
            if value:
                transformations.append(f"→ erstellt neues {value}")
                break

    return transformations

def build_fhir_path(parents, context, element):
    """Build FHIR path with improved readability"""
    def is_real(part):
        return (
            part
            and not part.startswith('src')
            and not part.startswith('tgt')
            and not part.endswith('Var')
        )
    
    parts = [p for p in parents if is_real(p)]
    if is_real(context):
        if context in parts:
            context_index = len(parts) - 1 - parts[::-1].index(context)
            parts = parts[: context_index + 1]
        elif not parts or parts[-1] != context:
            parts.append(context)
    if element:
        parts.append(element)
    
    return ".".join(parts)

def should_include(rule):
    """Determine if a rule should be included in the output"""
    return (
        rule.get('documentation') or
        rule.get('dependent') or
        has_meaningful_transformation(rule)
    )

def extract_relevant_rules(rules, src_parents=None, tgt_parents=None, mappings=None):
    """Extract relevant mapping rules with enhanced information"""
    if mappings is None:
        mappings = []
    if src_parents is None:
        src_parents = []
    if tgt_parents is None:
        tgt_parents = []
    
    for rule in rules:
        has_source = 'source' in rule and rule['source']
        has_target = 'target' in rule and rule['target']
        
        # Build source path
        if has_source:
            src = rule['source'][0]
            src_path = build_fhir_path(src_parents, src.get('context', ''), src.get('element', ''))
            if src.get('condition'):
                condition = src['condition']
                # Simplify common conditions
                if 'url=' in condition:
                    # Extract URL from condition for readability
                    url_match = re.search(r"url='([^']+)'", condition)
                    if url_match:
                        url = url_match.group(1)
                        src_path += f" [{url.split('/')[-1]}]"
                elif 'ofType(' in condition:
                    resource_type = re.search(r'ofType\((\w+)\)', condition)
                    if resource_type:
                        src_path += f" [Typ: {resource_type.group(1)}]"
                else:
                    src_path += f" [Bedingung: {condition}]"
        else:
            src_path = ""
        
        # Prepare description shared across targets
        base_desc_parts = []
        if rule.get('documentation'):
            base_desc_parts.append(rule['documentation'])
        if 'dependent' in rule:
            dependent_links = []
            for dep in rule['dependent']:
                dep_name = dep.get('name')
                if dep_name:
                    readable_name = dep_name.replace('ERPTPrescriptionStructureMap', '')
                    link = f"[{readable_name}](./StructureMap-{dep_name}.html)"
                    dependent_links.append(link)
            if dependent_links:
                base_desc_parts.append("Verwendet Mapping: " + ", ".join(dependent_links))

        # Build target paths (possibly multiple)
        tgt_path = ""
        target_entries = []
        if has_target:
            for target in rule['target']:
                tgt_candidate = build_fhir_path(tgt_parents, target.get('context', ''), target.get('element', ''))
                tgt_candidate_clean = format_target_path(tgt_candidate)
                target_entries.append((tgt_candidate_clean, target))
            tgt_path = build_fhir_path(tgt_parents, rule['target'][0].get('context', ''), rule['target'][0].get('element', ''))
        else:
            target_entries.append(("", None))

        # Clean paths for better readability
        src_path_clean = clean_path(src_path)
        if is_generic_source(src_path_clean):
            src_path_clean = ""

        if should_include(rule):
            for tgt_path_clean, tgt in target_entries:
                target_desc_parts = list(base_desc_parts)
                target_desc_parts.extend(extract_target_transformation_info(tgt))
                desc = "<br>".join(target_desc_parts)
                if src_path_clean or tgt_path_clean or desc:
                    mappings.append((src_path_clean, tgt_path_clean, desc))
        
        # Recurse into nested rules
        if 'rule' in rule:
            next_src_parents = src_path.split('.') if src_path else []
            next_tgt_parents = tgt_path.split('.') if tgt_path else []
            extract_relevant_rules(rule['rule'], next_src_parents, next_tgt_parents, mappings)
    
    return mappings

def structuremap_to_markdown(json_data):
    """Convert StructureMap to enhanced markdown table"""
    group = json_data['group'][0]
    mappings = extract_relevant_rules(group['rule'])
    
    # Filter out empty mappings
    filtered_mappings = [(src, tgt, desc) for src, tgt, desc in mappings if src or desc or (tgt and 'direkte Kopie' not in desc)]
    
    if not filtered_mappings:
        return "*(Keine bedeutsamen Transformationen gefunden - nur direkte Kopien)*"
    
    # Create header with better column names
    rows = [
        "| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Transformation & Beschreibung |",
        "|------------------------|---------------------|-------------------------------|",
    ]
    
    for src, tgt, desc in filtered_mappings:
        # Add visual indicators for empty fields
        src_display = f"`{src}`" if src else ""
        tgt_display = f"`{tgt}`" if tgt else "*(wird bestimmt durch Kontext)*"
        desc_display = desc if desc else "*(direkte Kopie)*"
        
        rows.append(f"| {src_display} | {tgt_display} | {desc_display} |")
    
    return "\n".join(rows)

def main():
    """Main function to process StructureMap file"""
    if len(sys.argv) != 2:
        print(f"Usage: python {sys.argv[0]} <StructureMap-file>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    try:
        with open(file_path, encoding="utf-8") as f:
            data = json.load(f)
        
        title = data.get('title') or data.get('name') or 'Unbekannt'
        description = data.get('description') or 'Keine Beschreibung verfügbar'

        print()
        print(f"**Titel:** {title}")
        print()
        print(f"**Beschreibung:** {description}")
        print()
        print(structuremap_to_markdown(data))
        
    except FileNotFoundError:
        print(f"Fehler: Datei '{file_path}' nicht gefunden.")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"Fehler: '{file_path}' ist keine gültige JSON-Datei.")
        sys.exit(1)
    except Exception as e:
        print(f"Fehler beim Verarbeiten der Datei: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
