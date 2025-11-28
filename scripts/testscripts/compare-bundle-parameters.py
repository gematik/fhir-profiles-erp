#!/usr/bin/env python3
"""Create Markdown tables showing how KBV bundle data maps into Provide Parameters.

The script compares a KBV bundle JSON file with the corresponding
Provide-Prescription Parameters JSON produced by the
``transform-kbv-bundle.py`` helper. For each relevant resource pair
(e.g. KBV Organization -> Parameters.organization), the script flattens
both structures and lines up fields by matching values, resulting in a
readable table that can be embedded in IG Publisher content.
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Tuple

ValueMap = List[Tuple[str, str, str]]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Erstellt Markdown-Übersichten für Bundle → Parameters Mapping"
    )
    parser.add_argument("bundle", type=Path, help="Pfad zum KBV Bundle (JSON)")
    parser.add_argument(
        "parameters", type=Path, help="Pfad zur Provide-Parameters Ressource (JSON)"
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=None,
        help="Optionaler Ausgabepfad für die Markdown-Datei (sonst STDOUT)",
    )
    return parser.parse_args()


def load_json(path: Path) -> Dict[str, Any]:
    with path.open("r", encoding="utf-8") as handle:
        return json.load(handle)


def flatten(obj: Any, prefix: str = "") -> Dict[str, Any]:
    flat: Dict[str, Any] = {}

    def _walk(value: Any, path: str) -> None:
        if isinstance(value, dict):
            if not value:
                flat[path] = {}
            for key, child in value.items():
                child_path = f"{path}.{key}" if path else key
                _walk(child, child_path)
        elif isinstance(value, list):
            if not value:
                flat[path] = []
            for index, child in enumerate(value):
                child_path = f"{path}[{index}]" if path else f"[{index}]"
                _walk(child, child_path)
        else:
            flat[path] = value

    if prefix:
        _walk(obj, prefix)
    else:
        _walk(obj, "")

    # Remove empty key when prefix is provided for scalars
    return {k: v for k, v in flat.items() if k}


def find_resource(bundle: Dict[str, Any], resource_type: str) -> Optional[Dict[str, Any]]:
    for entry in bundle.get("entry", []):
        resource = entry.get("resource")
        if resource and resource.get("resourceType") == resource_type:
            return resource
    return None


def find_medication_for_request(
    bundle: Dict[str, Any], med_request: Optional[Dict[str, Any]]
) -> Optional[Dict[str, Any]]:
    if not med_request:
        return None
    ref = med_request.get("medicationReference", {}).get("reference")
    if not ref:
        return None
    med_id = ref.split("/")[-1].split("urn:uuid:")[-1]
    for entry in bundle.get("entry", []):
        resource = entry.get("resource")
        if resource and resource.get("resourceType") == "Medication":
            rid = resource.get("id")
            if rid == med_id:
                return resource
    return None


def find_rx_parameter(parameters: Dict[str, Any]) -> Optional[Dict[str, Any]]:
    for param in parameters.get("parameter", []):
        if param.get("name") == "rxPrescription":
            return param
    return None


def find_part(rx_param: Optional[Dict[str, Any]], name: str) -> Optional[Dict[str, Any]]:
    if not rx_param:
        return None
    for part in rx_param.get("part", []):
        if part.get("name") == name:
            return part
    return None


def normalize_path(path: str) -> str:
    out = path
    while "[" in out and "]" in out:
        start = out.find("[")
        end = out.find("]", start)
        if start == -1 or end == -1:
            break
        out = out[:start] + out[end + 1 :]
    return out


def leaf(path: str) -> str:
    cleaned = normalize_path(path)
    return cleaned.split(".")[-1]


def values_equal(left: Any, right: Any) -> bool:
    if isinstance(left, (int, float)) and isinstance(right, (int, float)):
        return float(left) == float(right)
    return left == right


def find_matching_source(
    target_path: str,
    target_value: Any,
    source_flat: Dict[str, Any],
) -> Optional[str]:
    candidates = [k for k, v in source_flat.items() if values_equal(v, target_value)]
    if not candidates:
        return None
    target_leaf = leaf(target_path)
    leaf_matches = [c for c in candidates if leaf(c) == target_leaf]
    return leaf_matches[0] if leaf_matches else candidates[0]


def format_value(value: Any) -> str:
    if isinstance(value, str):
        display = value
    else:
        display = json.dumps(value, ensure_ascii=False)
    if len(display) > 120:
        display = display[:117] + "…"
    display = display.replace("|", "\\|")
    return f"`{display}`"


def build_rows(
    source_obj: Optional[Dict[str, Any]] | Dict[str, Any],
    source_prefix: str,
    target_obj: Optional[Dict[str, Any]] | Dict[str, Any],
    target_prefix: str,
) -> ValueMap:
    if not source_obj or not target_obj:
        return []
    source_flat = flatten(source_obj, source_prefix)
    target_flat = flatten(target_obj, target_prefix)
    rows: ValueMap = []
    for t_path in sorted(target_flat):
        t_value = target_flat[t_path]
        if isinstance(t_value, (dict, list)):
            continue
        s_path = find_matching_source(t_path, t_value, source_flat)
        rows.append((s_path or "—", t_path, format_value(t_value)))
    return rows


def table_for(title: str, rows: ValueMap) -> List[str]:
    if not rows:
        return [f"### {title}", "", "*Keine Daten vorhanden.*", ""]
    lines = [f"### {title}", "", "| KBV Pfad | Parameters Pfad | Wert |", "| --- | --- | --- |"]
    for source_path, target_path, value in rows:
        source_cell = f"`{source_path}`" if source_path != "—" else "—"
        lines.append(f"| {source_cell} | `{target_path}` | {value} |")
    lines.append("")
    return lines


def build_sections(bundle: Dict[str, Any], parameters: Dict[str, Any]) -> List[str]:
    rx_param = find_rx_parameter(parameters)
    identifier_rows = build_rows(
        bundle.get("identifier"),
        "Bundle.identifier",
        find_part(rx_param, "prescriptionId"),
        "Parameters.parameter[rxPrescription].part[prescriptionId]",
    )

    med_request = find_resource(bundle, "MedicationRequest")
    authored_rows = build_rows(
        {"authoredOn": med_request.get("authoredOn")} if med_request else None,
        "MedicationRequest",
        find_part(rx_param, "authoredOn"),
        "Parameters.parameter[rxPrescription].part[authoredOn]",
    )

    med_request_rows = build_rows(
        med_request,
        "MedicationRequest",
        (find_part(rx_param, "medicationRequest") or {}).get("resource"),
        "Parameters.parameter[rxPrescription].part[medicationRequest].resource",
    )

    org_rows = build_rows(
        find_resource(bundle, "Organization"),
        "Organization",
        (find_part(rx_param, "organization") or {}).get("resource"),
        "Parameters.parameter[rxPrescription].part[organization].resource",
    )

    prac_rows = build_rows(
        find_resource(bundle, "Practitioner"),
        "Practitioner",
        (find_part(rx_param, "practitioner") or {}).get("resource"),
        "Parameters.parameter[rxPrescription].part[practitioner].resource",
    )

    med_rows = build_rows(
        find_medication_for_request(bundle, med_request),
        "Medication",
        (find_part(rx_param, "medication") or {}).get("resource"),
        "Parameters.parameter[rxPrescription].part[medication].resource",
    )

    sections: List[str] = ["## Bundle → Parameters Mapping", ""]
    sections += table_for("Verordnungskennung", identifier_rows)
    sections += table_for("Ausstellungsdatum", authored_rows)
    sections += table_for("KBV MedicationRequest → EPA MedicationRequest", med_request_rows)
    sections += table_for("KBV Organization → EPA Organization", org_rows)
    sections += table_for("KBV Practitioner → EPA Practitioner", prac_rows)
    sections += table_for("KBV Medication → EPA Medication", med_rows)
    return sections


def write_output(markdown_lines: Iterable[str], output: Optional[Path]) -> None:
    content = "\n".join(markdown_lines).strip() + "\n"
    if output:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(content, encoding="utf-8")
    else:
        print(content)


def main() -> int:
    args = parse_args()
    bundle = load_json(args.bundle)
    parameters = load_json(args.parameters)
    markdown = build_sections(bundle, parameters)
    write_output(markdown, args.output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
