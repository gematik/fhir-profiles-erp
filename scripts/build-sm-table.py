import sys
import json
import re
from typing import List, Optional


def escape_markdown(text):
    """Escape characters that would break markdown tables."""
    if not isinstance(text, str):
        return text
    return text.replace("|", "\\|")


def translate_doc(text: Optional[str]) -> str:
    """Übersetzt häufige englische Doku-Schnipsel ins Deutsche."""
    if not text:
        return ""

    replacements = [
        (r"Automatic copy", "Automatische Kopie"),
        (r"Copied to '([^']+)'", r"Kopiert nach '\1'"),
        (r"Copied from '([^']+)'", r"Kopiert von '\1'"),
        (r"Fixed value '([^']+)'", r"Fester Wert '\1'"),
        (r"Copies.*", "Kopiert"),
    ]

    result = text
    for pattern, repl in replacements:
        result = re.sub(pattern, repl, result)
    return result

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
            if target.get('transform'):
                return True
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
    if doc and not doc.lower().startswith('copies') and doc.lower() not in {'automatic copy'}:
        return True
    
    return False


def build_path_for_entry(entry, parents, var_paths):
    """Resolve nested context variables to stable FHIR paths."""
    context = entry.get('context', '')
    element = entry.get('element', '')

    if context in var_paths:
        base_parts = var_paths[context].split('.') if var_paths[context] else []
        path = build_fhir_path(base_parts, '', element)
    else:
        path = build_fhir_path(parents, context, element)

    variable = entry.get('variable')
    if variable:
        var_paths[variable] = path

    return path

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
                escaped = escape_markdown(value)
                if 'http' in value or 'StructureDefinition' in value:
                    transformations.append(f"→ setzt URL '{escaped}'")
                else:
                    transformations.append(f"→ setzt Wert '{escaped}'")
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


def determine_action_label(rule, target):
    """Return a concise action label describing what the rule does."""
    labels = []
    transform_type = (target or {}).get('transform')
    parameters = (target or {}).get('parameter') or []

    if transform_type == 'create':
        labels.append("🆕 Erstellt")
    elif transform_type == 'copy':
        if any('valueId' in param for param in parameters):
            labels.append("✅ Kopiert")
        elif any(
            key in param
            for param in parameters
            for key in ("valueString", "valueUri", "valueCanonical", "valueBoolean", "valueInteger")
        ):
            labels.append("📝 Setzt Wert")

    if rule.get('dependent'):
        labels.append("📎 Delegiert")

    if any(source.get('condition') for source in rule.get('source', [])):
        labels.append("⚙️ Bedingt")

    if not labels:
        labels.append("ℹ️ Dokumentiert")

    return " · ".join(labels)

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
    doc = (rule.get('documentation') or '').strip()
    doc_meaningful = bool(doc and doc.lower() not in {'automatic copy'})
    has_children = bool(rule.get('rule'))
    return (
        doc_meaningful
        or rule.get('dependent')
        or has_meaningful_transformation(rule)
        or (not has_children and (rule.get('target') or rule.get('source')))
    )

def format_condition(condition: str) -> str:
    """Kürzt lange Bedingungslisten und übersetzt AND/OR ins Deutsche."""
    if not condition:
        return ""

    cond = condition.strip()

    # Sammle alle url != 'x'
    excluded = re.findall(r"url\s*!=\s*'([^']+)'", cond)
    if excluded:
        unique_excluded: List[str] = list(dict.fromkeys(excluded))  # Reihenfolge beibehalten
        preview = unique_excluded[:3]
        rest = len(unique_excluded) - len(preview)
        parts = ", ".join(preview)
        if rest > 0:
            parts += f", +{rest} weitere"
        cond = re.sub(r"url\s*!=\s*'[^']+'\s*(and\s*)?", "", cond)
        cond = cond.strip(" and ")
        cond = " und ".join(p for p in [f"url != [{parts}]", cond] if p)

    equals = re.findall(r"url\s*=\s*'([^']+)'", cond)
    if equals:
        unique_equals: List[str] = list(dict.fromkeys(equals))
        cond = re.sub(r"url\s*=\s*'[^']+'\s*(and\s*)?", "", cond)
        cond = cond.strip(" and ")
        eq_text = " oder ".join(f"'{e}'" for e in unique_equals)
        cond = " und ".join(p for p in [f"url = {eq_text}", cond] if p)

    cond = cond.replace("and", "und")
    cond = cond.replace("where", "wo")
    return f"Bedingung: {cond}" if cond else ""


def extract_relevant_rules(rules, src_parents=None, tgt_parents=None, mappings=None, var_paths=None):
    """Extract relevant mapping rules with enhanced information"""
    if mappings is None:
        mappings = []
    if src_parents is None:
        src_parents = []
    if tgt_parents is None:
        tgt_parents = []
    if var_paths is None:
        var_paths = {}
    
    for rule in rules:
        has_source = 'source' in rule and rule['source']
        has_target = 'target' in rule and rule['target']
        
        # Build source path
        src_path = ""
        if has_source:
            for idx, src in enumerate(rule['source']):
                candidate = build_path_for_entry(src, src_parents, var_paths)
                if idx == 0:
                    src_path = candidate
                    if src.get('condition'):
                        condition = src['condition']
                        # Simplify common conditions
                        if 'url=' in condition:
                            url_match = re.search(r"url='([^']+)'", condition)
                            if url_match:
                                url = url_match.group(1)
                                src_path += f" [{url.split('/')[-1]}]"
                            else:
                                simplified = format_condition(condition)
                                if simplified:
                                    src_path += f" [{simplified}]"
                        elif 'ofType(' in condition:
                            resource_type = re.search(r'ofType\((\w+)\)', condition)
                            if resource_type:
                                src_path += f" [Typ: {resource_type.group(1)}]"
                        else:
                            simplified = format_condition(condition)
                            if simplified:
                                src_path += f" [{simplified}]"
        src_path_raw = src_path
        
        # Prepare description shared across targets
        base_desc_parts = []
        if rule.get('documentation'):
            base_desc_parts.append(escape_markdown(translate_doc(rule['documentation'])))
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
            for idx, target in enumerate(rule['target']):
                tgt_candidate = build_path_for_entry(target, tgt_parents, var_paths)
                tgt_candidate_clean = format_target_path(clean_path(tgt_candidate))
                target_entries.append((tgt_candidate_clean, target, tgt_candidate))
                if idx == 0:
                    tgt_path = tgt_candidate
        else:
            target_entries.append(("", None, ""))

        # Clean paths for better readability
        src_path_clean = clean_path(src_path)
        if is_generic_source(src_path_clean):
            src_path_clean = ""

        if should_include(rule):
            for tgt_path_clean, tgt, _ in target_entries:
                target_desc_parts = list(base_desc_parts)
                target_desc_parts.extend(extract_target_transformation_info(tgt))
                desc = "<br>".join(part for part in target_desc_parts if part)
                if not desc:
                    desc = "*(direkte Kopie)*"
                action = determine_action_label(rule, tgt)
                if src_path_clean or tgt_path_clean or desc:
                    mappings.append((src_path_clean, tgt_path_clean, action, desc))
        
        # Recurse into nested rules
        if 'rule' in rule:
            next_src_parents = src_path_raw.split('.') if src_path_raw else src_parents
            next_tgt_parents = tgt_path.split('.') if tgt_path else tgt_parents
            extract_relevant_rules(rule['rule'], next_src_parents, next_tgt_parents, mappings, var_paths)
    
    return mappings

def structuremap_to_markdown(json_data):
    """Convert StructureMap to enhanced markdown table"""
    group = json_data['group'][0]
    mappings = extract_relevant_rules(group['rule'])

    filtered_mappings = [
        (src, tgt, action, desc)
        for src, tgt, action, desc in mappings
        if src or desc or (tgt and 'direkte Kopie' not in desc)
    ]

    filtered_mappings.sort(key=lambda row: ((row[0] or "~"), (row[1] or "")))

    if not filtered_mappings:
        return "*(Keine bedeutsamen Transformationen gefunden - nur direkte Kopien)*"

    rows = [
        "| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |",
        "|------------------------|---------------------|--------|-------------------------------|",
    ]

    for src, tgt, action, desc in filtered_mappings:
        src_display = f"`{src}`" if src else "—"
        tgt_display = f"`{tgt}`" if tgt else "—"
        desc_display = desc if desc else "*(direkte Kopie)*"
        rows.append(f"| {src_display} | {tgt_display} | {action} | {desc_display} |")

    return "\n".join(rows)

def main():
    """Main function to process StructureMap file"""
    if len(sys.argv) != 2:
        print(f"Aufruf: python {sys.argv[0]} <StructureMap-Datei>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    try:
        with open(file_path, encoding="utf-8") as f:
            data = json.load(f)
        
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
