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

ValueRow = Tuple[str, str, str, str]
ValueMap = List[ValueRow]

STATUS_LABELS = {
    "mapped": "✅ Übernommen",
    "new": "🆕 Nur Ziel",
    "unmapped": "⚠️ Offen"
}

STATUS_ORDER = {"mapped": 0, "new": 1, "unmapped": 2}


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
    parser.add_argument(
        "--source-link",
        type=str,
        default=None,
        help="Optionaler Link zum KBV Bundle (z. B. Bundle-xyz.html)",
    )
    parser.add_argument(
        "--source-label",
        type=str,
        default="KBV Bundle",
        help="Anzuzeigender Text für den Bundle-Link",
    )
    parser.add_argument(
        "--target-link",
        type=str,
        default=None,
        help="Optionaler Link zur Parameters-Ressource (z. B. Bundle-xyz-parameters.html)",
    )
    parser.add_argument(
        "--target-label",
        type=str,
        default="Provide Parameters",
        help="Anzuzeigender Text für den Parameters-Link",
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


def collect_rx_parts(parameters: Dict[str, Any]) -> List[Dict[str, Any]]:
    parts: List[Dict[str, Any]] = []
    for param in parameters.get("parameter", []):
        if param.get("name") == "rxPrescription":
            parts.extend(param.get("part", []))
    return parts


def find_part(rx_parts: Iterable[Dict[str, Any]] | None, name: str) -> Optional[Dict[str, Any]]:
    if not rx_parts:
        return None
    for part in rx_parts:
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
    target_display_prefix: Optional[str] = None,
) -> ValueMap:
    source_flat = flatten(source_obj, source_prefix) if source_obj else {}
    target_flat = flatten(target_obj, target_prefix) if target_obj else {}
    rows: ValueMap = []
    matched_sources: set[str] = set()

    for t_path in sorted(target_flat):
        t_value = target_flat[t_path]
        if isinstance(t_value, (dict, list)):
            continue
        s_path = find_matching_source(t_path, t_value, source_flat)
        if s_path:
            matched_sources.add(s_path)
        display_path = t_path
        if target_display_prefix and t_path.startswith(target_prefix):
            suffix = t_path[len(target_prefix) :]
            if suffix.startswith("."):
                suffix = suffix[1:]
            display_path = target_display_prefix
            if suffix:
                display_path = f"{target_display_prefix}.{suffix}"
        rows.append((s_path or "—", display_path, format_value(t_value), "mapped" if s_path else "new"))

    for s_path in sorted(source_flat):
        if s_path in matched_sources:
            continue
        s_value = source_flat[s_path]
        if isinstance(s_value, (dict, list)):
            continue
        rows.append((s_path, "—", format_value(s_value), "unmapped"))

    return rows


def table_for(title: str, rows: ValueMap) -> List[str]:
    if not rows:
        return [f"### {title}", "", "*Keine Daten vorhanden.*", ""]
    lines = [
        f"### {title}",
        "",
        "| KBV Pfad | EPA Pfad | Wert | Status |",
        "| --- | --- | --- | --- |",
    ]
    sorted_rows = sorted(
        rows,
        key=lambda r: (STATUS_ORDER.get(r[3], 99), r[0], r[1]),
    )
    for source_path, target_path, value, status in sorted_rows:
        source_cell = f"`{source_path}`" if source_path not in {"—", ""} else "—"
        target_cell = f"`{target_path}`" if target_path not in {"—", ""} else "—"
        lines.append(
            f"| {source_cell} | {target_cell} | {value} | {STATUS_LABELS.get(status, status)} |"
        )
    lines.append("")
    return lines


def build_sections(
    bundle: Dict[str, Any],
    parameters: Dict[str, Any],
    metadata_lines: Optional[List[str]] = None,
) -> List[str]:
    rx_parts = collect_rx_parts(parameters)
    identifier_rows = build_rows(
        bundle.get("identifier"),
        "Bundle.identifier",
        find_part(rx_parts, "prescriptionId"),
        "Parameters.parameter[rxPrescription].part[prescriptionId]",
        "Parameters.prescriptionId",
    )

    med_request = find_resource(bundle, "MedicationRequest")
    med_request_part = find_part(rx_parts, "medicationRequest") or {}
    med_request_resource = med_request_part.get("resource") if isinstance(med_request_part, dict) else None

    authored_rows = build_rows(
        {"authoredOn": med_request.get("authoredOn")} if med_request else None,
        "MedicationRequest",
        find_part(rx_parts, "authoredOn"),
        "Parameters.parameter[rxPrescription].part[authoredOn]",
        "Parameters.authoredOn",
    )

    if not authored_rows and med_request and med_request.get("authoredOn") and med_request_resource:
        authored_rows = build_rows(
            {"authoredOn": med_request.get("authoredOn")},
            "MedicationRequest",
            {"authoredOn": med_request_resource.get("authoredOn")},
            "Parameters.parameter[rxPrescription].part[medicationRequest].resource",
            "MedicationRequest",
        )

    med_request_rows = build_rows(
        med_request,
        "MedicationRequest",
        med_request_resource,
        "Parameters.parameter[rxPrescription].part[medicationRequest].resource",
        "MedicationRequest",
    )

    org_rows = build_rows(
        find_resource(bundle, "Organization"),
        "Organization",
        (find_part(rx_parts, "organization") or {}).get("resource"),
        "Parameters.parameter[rxPrescription].part[organization].resource",
        "Organization",
    )

    prac_rows = build_rows(
        find_resource(bundle, "Practitioner"),
        "Practitioner",
        (find_part(rx_parts, "practitioner") or {}).get("resource"),
        "Parameters.parameter[rxPrescription].part[practitioner].resource",
        "Practitioner",
    )

    med_rows = build_rows(
        find_medication_for_request(bundle, med_request),
        "Medication",
        (find_part(rx_parts, "medication") or {}).get("resource"),
        "Parameters.parameter[rxPrescription].part[medication].resource",
        "Medication",
    )

    sections: List[str] = ["## Bundle → Parameters Mapping", ""]
    if metadata_lines:
        sections += metadata_lines + [""]
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
    metadata: List[str] = []
    if args.source_link:
        metadata.append(f"> Quelle: [{args.source_label}]({args.source_link})")
    if args.target_link:
        metadata.append(f"> Ziel: [{args.target_label}]({args.target_link})")
    markdown = build_sections(bundle, parameters, metadata_lines=metadata or None)
    write_output(markdown, args.output)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
