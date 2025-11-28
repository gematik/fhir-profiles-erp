#!/usr/bin/env python3
"""Batch-transform all KBV bundles into Provide-Prescription Parameters.

This script iterates over all JSON bundles located in
``input/content/kbv-bundles`` (configurable) and invokes the existing
``transform-kbv-bundle.py`` helper for each file. The resulting Parameters
resources are written to ``input/content/transformed-kbv-bundles`` (also
configurable) using the pattern ``<bundle-name>-parameters.json``.
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path
from typing import Iterable

SCRIPT_DIR = Path(__file__).resolve().parent
TRANSFORM_SCRIPT = SCRIPT_DIR / "transform-kbv-bundle.py"
DEFAULT_SOURCE_DIR = (
    Path(__file__).resolve().parents[2] / "input" / "content" / "kbv-bundles"
)
DEFAULT_OUTPUT_DIR = (
    Path(__file__).resolve().parents[2]
    / "input"
    / "content"
    / "transformed-kbv-bundles"
)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Wandelt alle KBV Bundles in Provide-Prescription Parameters um"
    )
    parser.add_argument(
        "--source-dir",
        type=Path,
        default=DEFAULT_SOURCE_DIR,
        help="Eingabeverzeichnis mit KBV Bundles (.json)",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=DEFAULT_OUTPUT_DIR,
        help="Zielverzeichnis für Parameters-Ressourcen",
    )
    parser.add_argument(
        "--transform",
        default=None,
        help="Optionaler Override der StructureMap Canonical URL",
    )
    parser.add_argument(
        "--hapi-jar",
        type=Path,
        default=None,
        help="Pfad zum HAPI Validator Jar (wird an transform-kbv-bundle.py weitergereicht)",
    )
    parser.add_argument(
        "--fail-fast",
        action="store_true",
        help="Stoppt beim ersten Fehler statt weiterzumachen",
    )
    parser.add_argument(
        "--skip-existing",
        action="store_true",
        help="Überspringt Bundles, für die bereits eine Ausgabedatei existiert",
    )
    return parser.parse_args()


def discover_bundles(source_dir: Path) -> Iterable[Path]:
    if not source_dir.exists():
        raise FileNotFoundError(f"Quellverzeichnis existiert nicht: {source_dir}")
    yield from sorted(p for p in source_dir.glob("*.json") if p.is_file())


def build_command(bundle: Path, output: Path, args: argparse.Namespace) -> list[str]:
    cmd = [sys.executable, str(TRANSFORM_SCRIPT), str(bundle), str(output)]
    if args.transform:
        cmd.extend(["--transform", args.transform])
    if args.hapi_jar:
        cmd.extend(["--hapi-jar", str(args.hapi_jar)])
    return cmd


def run_command(cmd: list[str], cwd: Path) -> subprocess.CompletedProcess[str]:
    return subprocess.run(cmd, cwd=str(cwd), text=True, capture_output=True)


def main() -> int:
    args = parse_args()
    bundles = list(discover_bundles(args.source_dir))

    if not bundles:
        print(f"Keine Bundles in {args.source_dir} gefunden.")
        return 0

    args.output_dir.mkdir(parents=True, exist_ok=True)
    project_root = Path(__file__).resolve().parents[2]

    failures: list[str] = []
    for bundle in bundles:
        target = args.output_dir / f"{bundle.stem}-parameters.json"
        if args.skip_existing and target.exists():
            print(f"➡️  Überspringe {bundle.name} (bereits vorhanden)")
            continue

        print(f"🚀 Transformiere {bundle.name} …")
        cmd = build_command(bundle, target, args)
        result = run_command(cmd, project_root)

        if result.returncode != 0:
            failures.append(bundle.name)
            print(result.stdout)
            print(result.stderr, file=sys.stderr)
            print(f"❌ Fehler bei {bundle.name}")
            if args.fail_fast:
                break
            continue

        print(f"✅ {bundle.name} → {target.relative_to(project_root)}")

    if failures:
        print("\nZusammenfassung: Einige Bundles konnten nicht transformiert werden:")
        for name in failures:
            print(f"  - {name}")
        return 1

    print("\nAlle Bundles erfolgreich transformiert.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
