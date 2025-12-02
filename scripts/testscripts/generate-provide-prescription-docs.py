#!/usr/bin/env python3
"""Generate Provide Prescription artifacts for the IG build.

Steps executed:
1. Run ``transform-all-kbv-bundles.py`` to produce Provide Parameters files.
2. Execute ``compare-bundle-parameters.py`` for every Parameters file to produce
   Bundle→Parameters mapping tables in ``input/pagecontent``.
3. Refresh ``input/pagecontent/provide-prescription-mappings.md`` so readers can
   navigate all generated tables from the IG.
"""
from __future__ import annotations

import argparse
import datetime as _dt
import json
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Iterable, List

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent

DEFAULT_BUNDLE_DIR = PROJECT_ROOT / "input" / "content" / "kbv-bundles"
DEFAULT_PARAMETER_DIR = PROJECT_ROOT / "input" / "content" / "transformed-kbv-bundles"
DEFAULT_MAPPING_DIR = PROJECT_ROOT / "input" / "pagecontent"
DEFAULT_INCLUDE_DIR = PROJECT_ROOT / "input" / "includes"
DEFAULT_FHIR_RESOURCE_DIR = PROJECT_ROOT / "fsh-generated" / "resources"
TRANSFORM_SCRIPT = SCRIPT_DIR / "transform-all-kbv-bundles.py"
COMPARE_SCRIPT = SCRIPT_DIR / "compare-bundle-parameters.py"
OVERVIEW_FILENAME = "provide-prescription-mappings.md"
INCLUDE_FILENAME = "provide-prescription-mapping-links.md"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Erstellt Provide-Parameters und Mapping-Dokumentation für den IG Build"
    )
    parser.add_argument("--bundle-dir", type=Path, default=DEFAULT_BUNDLE_DIR)
    parser.add_argument("--parameter-dir", type=Path, default=DEFAULT_PARAMETER_DIR)
    parser.add_argument("--mapping-dir", type=Path, default=DEFAULT_MAPPING_DIR)
    parser.add_argument("--include-dir", type=Path, default=DEFAULT_INCLUDE_DIR)
    parser.add_argument("--fhir-resource-dir", type=Path, default=DEFAULT_FHIR_RESOURCE_DIR)
    parser.add_argument(
        "--python",
        type=str,
        default=sys.executable,
        help="Python-Interpreter für die Hilfsskripte (standardmäßig aktueller Interpreter)",
    )
    parser.add_argument(
        "--skip-transform",
        action="store_true",
        help="Überspringt den Transformationsschritt",
    )
    parser.add_argument(
        "--skip-mappings",
        action="store_true",
        help="Überspringt die Erstellung der Mapping-Tabellen",
    )
    return parser.parse_args()


def run(cmd: List[str]) -> None:
    result = subprocess.run(cmd, cwd=str(PROJECT_ROOT))
    if result.returncode != 0:
        raise SystemExit(result.returncode)


def transform_bundles(args: argparse.Namespace) -> None:
    if args.skip_transform:
        print("[INFO] Transformationsschritt übersprungen")
        return
    args.parameter_dir.mkdir(parents=True, exist_ok=True)
    cmd = [
        args.python,
        str(TRANSFORM_SCRIPT),
        "--source-dir",
        str(args.bundle_dir),
        "--output-dir",
        str(args.parameter_dir),
    ]
    print("[STEP] Transformiere KBV Bundles in Provide Parameters")
    run(cmd)


def discover_parameter_files(parameter_dir: Path) -> List[Path]:
    return sorted(parameter_dir.glob("*-parameters.json"))


def bundle_name_from_parameter(parameter_file: Path) -> str:
    suffix = "-parameters.json"
    if parameter_file.name.endswith(suffix):
        return parameter_file.name[: -len(suffix)]
    return parameter_file.stem


def generate_mapping_tables(args: argparse.Namespace) -> List[str]:
    if args.skip_mappings:
        print("[INFO] Mapping-Erstellung übersprungen")
        return []

    args.mapping_dir.mkdir(parents=True, exist_ok=True)
    parameter_files = discover_parameter_files(args.parameter_dir)
    if not parameter_files:
        print("[INFO] Keine Parameters-Dateien zum Vergleichen gefunden")
        return []

    processed: List[str] = []
    for param_file in parameter_files:
        base_name = bundle_name_from_parameter(param_file)
        bundle_file = args.bundle_dir / f"{base_name}.json"
        if not bundle_file.exists():
            print(f"[WARN] Kein Bundle für Parameters-Datei gefunden: {param_file.name}")
            continue
        output_file = args.mapping_dir / f"{base_name}-mapping.md"
        cmd = [
            args.python,
            str(COMPARE_SCRIPT),
            str(bundle_file),
            str(param_file),
            "--output",
            str(output_file),
            "--source-link",
            f"{base_name}.html",
            "--source-label",
            "KBV Bundle",
            "--target-link",
            f"{base_name}-parameters.html",
            "--target-label",
            "EPA Provide Parameters",
        ]
        run(cmd)
        print(f"[INFO] Mapping aktualisiert: {output_file.name}")
        processed.append(base_name)

    return processed


def label_for_mapping(filename: str) -> str:
    base = filename
    if base.startswith("Bundle-"):
        base = base[len("Bundle-") :]
    uuid_part = base
    kvnr_part = ""
    if "--" in base:
        uuid_part, kvnr_part = base.split("--", 1)
    label = f"Bundle {uuid_part}"
    if kvnr_part and kvnr_part != uuid_part:
        label += f" (KVNR {kvnr_part})"
    return label


def collect_mapping_files(mapping_dir: Path) -> List[Path]:
    return sorted(mapping_dir.glob("Bundle-*-mapping.md"))


def write_overview(mapping_files: List[Path], mapping_dir: Path) -> None:
    lines = [
        "## Provide Prescription Mapping Tables",
        "",
        f"Automatisch generiert am {_dt.date.today():%Y-%m-%d}.",
        "",
        "Die folgenden Seiten beschreiben das Mapping von KBV Bundles zu Provide Parameters.",
        "",
        "### Bundles",
        "",
    ]

    if not mapping_files:
        lines.append("*Noch keine Mapping-Dateien generiert.*")
    else:
        for file in mapping_files:
            base = file.name
            name_without_suffix = base
            if name_without_suffix.endswith("-mapping.md"):
                name_without_suffix = name_without_suffix[: -len("-mapping.md")]
            label = label_for_mapping(name_without_suffix)
            html_target = base.replace(".md", ".html")
            lines.append(f"- [{label}]({html_target})")
    lines.extend(
        [
            "",
            "> Diese Datei wird automatisch durch scripts/testscripts/generate-provide-prescription-docs.py erzeugt.",
            "",
        ]
    )

    overview_path = mapping_dir / OVERVIEW_FILENAME
    overview_path.write_text("\n".join(lines), encoding="utf-8")
    print("[INFO] provide-prescription-mappings.md aktualisiert")


def write_include_links(mapping_files: List[Path], include_dir: Path) -> None:
    include_dir.mkdir(parents=True, exist_ok=True)
    if not mapping_files:
        content = "*Noch keine Mapping-Dateien generiert.*\n"
    else:
        lines = []
        for file in mapping_files:
            base = file.name
            name_without_suffix = base
            if name_without_suffix.endswith("-mapping.md"):
                name_without_suffix = name_without_suffix[: -len("-mapping.md")]
            label = label_for_mapping(name_without_suffix)
            html_target = base.replace(".md", ".html")
            lines.append(f"- [{label}]({html_target})")
        content = "\n".join(lines) + "\n"

    include_path = include_dir / INCLUDE_FILENAME
    include_path.write_text(content, encoding="utf-8")
    print("[INFO] provide-prescription-mapping-links.md aktualisiert")


def determine_destination_name(source: Path, resource_type: str | None) -> str:
    if not resource_type:
        return source.name
    prefix = f"{resource_type}-"
    name = source.name
    if name.startswith(prefix):
        return name
    remainder = name
    if "-" in name:
        remainder = name.split("-", 1)[1]
    return prefix + remainder


def detect_resource_type(path: Path) -> str | None:
    try:
        with path.open("r", encoding="utf-8") as handle:
            data = json.load(handle)
        value = data.get("resourceType")
        return value if isinstance(value, str) else None
    except Exception as exc:  # noqa: BLE001
        print(f"[WARN] Konnte resourceType nicht ermitteln ({path}): {exc}")
        return None


def copy_resources(processed_bundles: List[str], args: argparse.Namespace) -> None:
    if not processed_bundles:
        return
    dest_dir = args.fhir_resource_dir
    dest_dir.mkdir(parents=True, exist_ok=True)
    for base_name in processed_bundles:
        bundle_file = args.bundle_dir / f"{base_name}.json"
        param_file = args.parameter_dir / f"{base_name}-parameters.json"
        for source in (bundle_file, param_file):
            if not source.exists():
                print(f"[WARN] Quelldatei nicht gefunden: {source}")
                continue
            resource_type = detect_resource_type(source)
            destination_name = determine_destination_name(source, resource_type)
            destination = dest_dir / destination_name
            shutil.copy2(source, destination)
            try:
                rel_path = destination.relative_to(PROJECT_ROOT)
            except ValueError:
                rel_path = destination
            print(f"[INFO] Ressource aktualisiert: {rel_path}")


def main() -> None:
    args = parse_args()
    transform_bundles(args)
    processed_bundles = generate_mapping_tables(args)
    mapping_files = collect_mapping_files(args.mapping_dir)
    write_overview(mapping_files, args.mapping_dir)
    write_include_links(mapping_files, args.include_dir)
    copy_resources(processed_bundles, args)


if __name__ == "__main__":
    main()
