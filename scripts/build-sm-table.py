import sys
import json
import re
from typing import List, Optional

MANUAL_ACTION_LABEL = "Manuell"
FIXED_VALUE_PARAM_KEYS = (
    "valueString",
    "valueUri",
    "valueCanonical",
    "valueBoolean",
    "valueInteger",
)


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


def parse_manual_documentation(text: Optional[str]) -> Optional[dict]:
    """Erkennt und extrahiert Hinweise aus 'Manual action required' Dokumentation."""
    if not text:
        return None

    if "manual action" not in text.lower():
        return None

    parts = [part.strip() for part in text.split('|')]
    instructions = []
    field_value = ""

    for part in parts:
        lower_part = part.lower()
        if not part:
            continue
        if "manual action" in lower_part:
            continue
        if lower_part.startswith('field:'):
            field_value = part.split(':', 1)[1].strip()
            continue
        instructions.append(part)

    if not instructions and not field_value:
        return None

    instruction_text = " | ".join(instructions).strip()
    return {
        "instruction": instruction_text,
        "field": field_value,
        "is_manual": True,
    }

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
            transform_type = target.get('transform')
            if transform_type and transform_type != 'copy':
                return True
            if transform_type == 'copy' and 'parameter' in target:
                for param in target['parameter']:
                    if 'valueString' in param:
                        value = param['valueString']
                        # URL transformations are meaningful
                        if 'http' in value or 'StructureDefinition' in value:
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
            fixed_value = next(
                (param[key] for key in FIXED_VALUE_PARAM_KEYS if key in param),
                None,
            )
            if fixed_value is not None:
                escaped = escape_markdown(str(fixed_value))
                transformations.append(f"setzt festen Wert: `{escaped}`")
            elif 'valueId' in param:
                transformations.append("übernimmt Wert aus Quellvariable")
    elif transform_type == 'create':
        for param in parameters:
            value = param.get('valueString')
            if value:
                transformations.append(f"erstellt neues {value}")
                break

    return transformations


def determine_action_label(rule, target):
    """Return a concise action label describing what the rule does."""
    doc_text = (rule.get('documentation') or '').strip().lower()
    if doc_text.startswith("feld wird nicht gemappt"):
        return "Nicht Übertragen"

    labels = []
    transform_type = (target or {}).get('transform')
    parameters = (target or {}).get('parameter') or []

    has_fixed_value = any(
        any(key in param for key in FIXED_VALUE_PARAM_KEYS)
        for param in parameters
    )

    if transform_type == 'create':
        labels.append("Erstellt")
    elif transform_type == 'copy':
        if has_fixed_value:
            labels.append("Fester Wert")
        else:
            labels.append("Kopiert")

    if rule.get('dependent'):
        labels.append("Delegiert")

    if not labels:
        labels.append("Dokumentiert")

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

    # Wenn es ein positives url = gibt, zeige nur das (url != ist i.d.R. nur Filter-Rauschen)
    equals = re.findall(r"url\s*=\s*'([^']+)'", cond)
    if equals:
        unique_equals: List[str] = list(dict.fromkeys(equals))
        if len(unique_equals) == 1:
            return f"Bedingung: url = '{unique_equals[0]}'"
        eq_text = " oder ".join(f"'{e}'" for e in unique_equals)
        return f"Bedingung: url = {eq_text}"

    # Entferne reine url != Filter (die werden nicht mehr angezeigt)
    cond = re.sub(r"url\s*!=\s*'[^']+'\s*(and\s*)?", "", cond)
    cond = re.sub(r"\s+", " ", cond).strip()
    cond = re.sub(r"^(and\s+)+", "", cond)
    cond = re.sub(r"(\s+and)+$", "", cond)

    cond = cond.replace(" and ", " und ")
    cond = cond.replace(" where ", " wo ")
    return f"Bedingung: {cond}" if cond else ""


def extract_condition_text(src_path: str) -> str:
    """Extrahiert den Bedingungs-Text aus einem Quellpfad-Suffix '[...]'."""
    if not src_path:
        return ""
    match = re.search(r"\[(Bedingung: .+)\]", src_path)
    if match:
        return match.group(1).strip()
    return ""


def extract_url_value_from_condition(condition_text: str) -> str:
    if not condition_text:
        return ""
    match = re.search(r"url\s*=\s*'([^']+)'", condition_text)
    return match.group(1) if match else ""


def shorten_url_label(url: str) -> str:
    if not url:
        return ""
    return url.rstrip('/').split('/')[-1]


def is_exclusion_only_condition(condition: str) -> bool:
    """True, wenn nur url != ... Klauseln enthalten sind und keine positiven Checks."""
    if not condition:
        return False

    has_not_equals = bool(re.search(r"url\s*!=\s*'[^']+'", condition))
    has_equals = bool(re.search(r"url\s*=\s*'[^']+'", condition))
    has_other_ops = bool(re.search(r"ofType\(|where\(|exists|=~", condition))
    return has_not_equals and not has_equals and not has_other_ops


def is_passthrough_copy_target(target: dict) -> bool:
    """Erkennt einfache Kopien (valueId) ohne weitere Parameter."""
    if not target:
        return False
    if target.get('transform') != 'copy':
        return False

    params = target.get('parameter', [])
    if not params:
        return True
    return all(set(p.keys()) == {'valueId'} for p in params)


def is_simple_create_target(target: dict) -> bool:
    """Erkennt einfache create-Ziele ohne feste Werte/Parameter."""
    if not target:
        return False
    if target.get('transform') != 'create':
        return False
    params = target.get('parameter', [])
    if not params:
        return True
    # If there is any fixed value (excluding valueString type hints), treat as meaningful
    for param in params:
        if any(key in param for key in FIXED_VALUE_PARAM_KEYS if key != 'valueString'):
            return False
    return True


def is_passthrough_copy_rule(rule: dict) -> bool:
    """Skippt reine Durchreiche-Kopien (z. B. url != ... Filter)."""
    targets = rule.get('target') or []
    if not targets:
        return False
    if not all(is_passthrough_copy_target(t) for t in targets):
        return False
    if rule.get('dependent'):
        return False
    return True


def extract_resource_type_from_conditions(conditions: List[str]) -> str:
    """Extract resource type from conditions like `resource is X`."""
    if not conditions:
        return ""
    for condition in conditions:
        if not condition:
            continue
        match = re.search(r"resource\s+is\s+(\w+)", condition)
        if match:
            return match.group(1)
    return ""


def has_meaningful_condition(conditions: List[str]) -> bool:
    """True, wenn Bedingungen mehr sind als reine Ausschlussfilter."""
    if not conditions:
        return False
    for condition in conditions:
        if not condition:
            continue
        if is_exclusion_only_condition(condition):
            continue
        return True
    return False


def extract_relevant_rules(
    rules,
    src_parents=None,
    tgt_parents=None,
    mappings=None,
    var_paths=None,
    inherited_suffix="",
    keep_copy_rows=False,
    skip_create_docs=False,
    inherited_resource_type="",
):
    """Extract relevant mapping rules mit Vererbungs-Hinweisen für Bedingungen."""
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
        source_conditions = [src.get('condition') for src in rule.get('source', []) if src.get('condition')]
        exclusion_only = bool(source_conditions) and all(is_exclusion_only_condition(c) for c in source_conditions)
        passthrough_copy = is_passthrough_copy_rule(rule)
        meaningful_condition = has_meaningful_condition(source_conditions)
        resource_type = extract_resource_type_from_conditions(source_conditions) or inherited_resource_type
        
        # Build source path
        src_path = ""
        src_path_plain = ""
        first_source_element = None
        src_suffix = inherited_suffix
        if has_source:
            for idx, src in enumerate(rule['source']):
                candidate = build_path_for_entry(src, src_parents, var_paths)
                if idx == 0:
                    first_source_element = src.get('element')
                    src_path = candidate
                    src_path_plain = candidate
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
                    # merke Suffix des Elternpfades (z. B. [url=...]) zur Vererbung
                    suffix_match = re.search(r"(\s*\[.*\])$", src_path)
                    if suffix_match:
                        src_suffix = suffix_match.group(1)
        if src_suffix and src_suffix not in src_path:
            src_path = f"{src_path} {src_suffix}".strip()
        src_path_raw = src_path
        
        # Prepare description shared across targets
        base_desc_parts = []
        rule_manual_info = parse_manual_documentation(rule.get('documentation'))
        doc_text = (rule.get('documentation') or '').strip()
        doc_text_lower = doc_text.lower()
        is_copy_doc = (
            doc_text_lower == 'automatic copy'
            or doc_text_lower.startswith('copied to')
            or doc_text_lower.startswith('copied from')
            or doc_text_lower.startswith('copies')
        )
        doc_meaningful = bool(doc_text and not is_copy_doc)
        if rule.get('documentation') and not rule_manual_info:
            translated_doc = escape_markdown(translate_doc(rule['documentation']))
            auto_copy_docs = {"Automatische Kopie", "Kopiert"}
            if (
                translated_doc
                and not translated_doc.startswith("Fester Wert")
                and translated_doc not in auto_copy_docs
                and not translated_doc.startswith("Kopiert von")
                and not translated_doc.startswith("Kopiert nach")
                and not translated_doc.startswith("Kopiert")
            ):
                base_desc_parts.append(translated_doc)
        if 'dependent' in rule:
            dependent_links = []
            for dep in rule['dependent']:
                dep_name = dep.get('name')
                if dep_name:
                    readable_name = dep_name.replace('ERPTPrescriptionStructureMap', '')
                    link = f"[{readable_name}](./StructureMap-{dep_name}.html)"
                    dependent_links.append(link)
            if dependent_links:
                base_desc_parts.append("Verwendet StructureMap: " + ", ".join(dependent_links))

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

        if should_include(rule) and not (exclusion_only and passthrough_copy):
            # Skip pure passthrough copies without changes/conditions/docs.
            if (
                not keep_copy_rows
                and passthrough_copy
                and not rule_manual_info
                and not doc_meaningful
                and not has_meaningful_transformation(rule)
                and not meaningful_condition
            ):
                continue
            for tgt_path_clean, tgt, _ in target_entries:
                target_desc_parts = list(base_desc_parts)
                if passthrough_copy and first_source_element == 'extension' and (tgt or {}).get('element', '').startswith('extension'):
                    target_desc_parts.append("Kopiert komplette Extension inklusive Werte")
                if keep_copy_rows and resource_type and "entry.resource" in (src_path_clean or ""):
                    target_desc_parts.append(f"Ressource: {resource_type}")
                target_desc_parts.extend(extract_target_transformation_info(tgt))
                desc = "<br>".join(part for part in target_desc_parts if part)
                if not desc:
                    desc = "*(direkte Kopie)*"
                action = determine_action_label(rule, tgt)
                output_tgt_path = tgt_path_clean

                if skip_create_docs and doc_text_lower.startswith("creates "):
                    continue
                if skip_create_docs and action == "Dokumentiert" and desc == "*(direkte Kopie)*":
                    continue

                # Skip simple create actions without meaningful transformation.
                if (
                    action == "Erstellt"
                    and is_simple_create_target(tgt)
                    and not rule_manual_info
                    and not rule.get('dependent')
                ):
                    continue

                # Skip plain copies without changes/logic.
                if not keep_copy_rows:
                    if (
                        action == "Kopiert"
                        and is_passthrough_copy_target(tgt)
                        and not rule_manual_info
                        and not rule.get('dependent')
                    ):
                        continue

                if rule_manual_info:
                    manual_instruction = rule_manual_info.get('instruction', '').strip()
                    if manual_instruction:
                        desc = escape_markdown(manual_instruction)
                    else:
                        desc = "Manual action required"
                    action = MANUAL_ACTION_LABEL
                    manual_field = rule_manual_info.get('field')
                    if manual_field:
                        output_tgt_path = manual_field

                if src_path_clean or output_tgt_path or desc:
                    mappings.append((src_path_clean, output_tgt_path, action, desc))
        
        # Recurse into nested rules
        if 'rule' in rule:
            next_src_parents = src_path_plain.split('.') if src_path_plain else src_parents
            next_tgt_parents = tgt_path.split('.') if tgt_path else tgt_parents
            extract_relevant_rules(
                rule['rule'],
                next_src_parents,
                next_tgt_parents,
                mappings,
                var_paths,
                src_suffix,
                keep_copy_rows=keep_copy_rows,
                skip_create_docs=skip_create_docs,
                inherited_resource_type=resource_type,
            )
    
    return mappings

def structuremap_to_markdown(json_data):
    """Convert StructureMap to enhanced markdown table"""
    group = json_data['group'][0]
    inputs = group.get('input', [])
    src_type = (inputs[0].get('type') if len(inputs) > 0 else "") or ""
    tgt_type = (inputs[1].get('type') if len(inputs) > 1 else "") or ""
    is_bundle_to_parameters = (
        "bundle" in src_type.lower() and "parameters" in tgt_type.lower()
    )

    mappings = extract_relevant_rules(
        group['rule'],
        keep_copy_rows=is_bundle_to_parameters,
        skip_create_docs=is_bundle_to_parameters,
    )

    filtered_mappings = [
        (src, tgt, action, desc)
        for src, tgt, action, desc in mappings
        if src or desc or (tgt and 'direkte Kopie' not in desc)
    ]

    # IMPORTANT: Keep the natural StructureMap rule order (depth-first traversal).
    # A global sort by source/target path destroys the rule tree grouping and makes
    # related fields hard to read (e.g. part.name separated from its part.resource).

    if not filtered_mappings:
        return "*(Keine bedeutsamen Transformationen gefunden - nur direkte Kopien)*"

    # Teile in "normale" Mappings und Extension-Cluster auf.
    extension_rows = []
    normal_rows = []
    for src, tgt, action, desc in filtered_mappings:
        if (tgt or "").startswith("EPAMedicationRequest.extension") or (".extension" in (src or "")):
            extension_rows.append((src, tgt, action, desc))
        else:
            normal_rows.append((src, tgt, action, desc))

    out_lines = []

    def format_source_cell(src):
        if not src:
            return "—"
        if '[' in src:
            bracket_index = src.find('[')
            prefix = src[:bracket_index].rstrip()
            suffix = src[bracket_index:].strip()
            if prefix:
                return f"`{prefix}`<br>`{suffix}`"
        return f"`{src}`"

    def render_table(rows_to_render):
        rows_out = [
            "| Quelle (Eingangsdaten) | Ziel (Ausgabedaten) | Aktion | Transformation & Beschreibung |",
            "|------------------------|---------------------|--------|-------------------------------|",
        ]
        for src, tgt, action, desc in rows_to_render:
            src_display = format_source_cell(src)
            tgt_display = f"`{tgt}`" if tgt else "—"
            desc_display = desc if desc else "*(direkte Kopie)*"
            rows_out.append(f"| {src_display} | {tgt_display} | {action} | {desc_display} |")
        return "\n".join(rows_out)

    if normal_rows:
        out_lines.append("### Feld-Mappings")
        out_lines.append("")
        out_lines.append(render_table(normal_rows))

    if extension_rows:
        # Gruppiere nach Bedingung/url (damit url/value direkt zusammen erscheinen)
        groups = {}
        group_order = []
        for src, tgt, action, desc in extension_rows:
            condition_text = extract_condition_text(src or "")
            url_value = extract_url_value_from_condition(condition_text)
            key = url_value or condition_text or "(ohne Bedingung)"
            if key not in groups:
                groups[key] = []
                group_order.append(key)
            groups[key].append((src, tgt, action, desc))

        out_lines.append("")
        out_lines.append("### Extensions")
        out_lines.append("")

        for key in group_order:
            group_rows = groups[key]

            if key.startswith("http"):
                out_lines.append(f"#### Extension: {shorten_url_label(key)}")
                out_lines.append(f"Bedingung: url = `{key}`")
            else:
                out_lines.append(f"#### Extension: {key}")
            out_lines.append("")
            out_lines.append(render_table(group_rows))
            out_lines.append("")

    return "\n".join(out_lines).rstrip() + "\n"

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
