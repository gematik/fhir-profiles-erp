#!/usr/bin/env python3
"""Batch-transform all KBV bundles into Provide-Prescription Parameters.

This script iterates over all JSON bundles located in
``input/resources/kbv-bundles`` (configurable) and invokes the existing
``transform-kbv-bundle.py`` helper for each file. The resulting Parameters
resources are written to ``input/resources/transformed-kbv-bundles`` (also
configurable) using the pattern ``<bundle-name>-parameters.json``.
"""
from __future__ import annotations

import argparse
import subprocess
import sys
import shutil
from pathlib import Path
from typing import Iterable

SCRIPT_DIR = Path(__file__).resolve().parent
TRANSFORM_SCRIPT = SCRIPT_DIR / "transform-kbv-bundle.py"
PROJECT_ROOT = Path(__file__).resolve().parents[2]
DEFAULT_SOURCE_DIR = PROJECT_ROOT / "input" / "resources" / "kbv-bundles"
DEFAULT_OUTPUT_DIR = PROJECT_ROOT / "input" / "resources" / "transformed-kbv-bundles"


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


def clear_output_dir(path: Path) -> None:
    if not path.exists():
        return
    for entry in path.iterdir():
        if entry.is_file() or entry.is_symlink():
            entry.unlink()
        else:
            shutil.rmtree(entry)


def build_command(bundle: Path, output: Path, args: argparse.Namespace) -> list[str]:
    cmd = [sys.executable, str(TRANSFORM_SCRIPT), str(bundle), str(output)]
    if args.transform:
        cmd.extend(["--transform", args.transform])
    if args.hapi_jar:
        cmd.extend(["--hapi-jar", str(args.hapi_jar)])
    return cmd


def run_command(cmd: list[str], cwd: Path) -> subprocess.CompletedProcess[str]:
    return subprocess.run(cmd, cwd=str(cwd), text=True, capture_output=True)


def derive_output_name(bundle_file: Path) -> str:
    name = bundle_file.stem
    token = name
    if name.startswith("Bundle-input-"):
        token = name[len("Bundle-input-") :]
    return f"Parameters-output-{token}.json"


def main() -> int:
    args = parse_args()
    bundles = list(discover_bundles(args.source_dir))

    if not bundles:
        print(f"Keine Bundles in {args.source_dir} gefunden.")
        return 0

    args.output_dir.mkdir(parents=True, exist_ok=True)
    print(f"[STEP] Bereinige Zielverzeichnis: {args.output_dir}")
    clear_output_dir(args.output_dir)
    project_root = Path(__file__).resolve().parents[2]

    failures: list[str] = []
    for bundle in bundles:
        def build_output_name(source_file: Path) -> str:
            name = source_file.stem
            token = name
            if name.startswith("Bundle-input-"):
                token = name[len("Bundle-input-") :]
            return f"Parameters-output-{token}.json"

        target = args.output_dir / derive_output_name(bundle)
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
