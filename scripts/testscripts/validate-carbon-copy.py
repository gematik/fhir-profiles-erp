#!/usr/bin/env python3
"""Validate generated carbon copy resources against the BfArM profile."""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path

DEFAULT_HAPI_JAR = Path("/Users/gematik/dev/validators/current_hapi_validator.jar")
DEFAULT_PROFILE = "https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-carbon-copy"
DEFAULT_FHIR_VERSION = "4.0.1"


def load_ig_dependencies(project_root: Path) -> list[str]:
    """Load IG dependencies from package.json, returning `package#version` entries."""
    package_json = project_root / "package.json"
    try:
        data = json.loads(package_json.read_text())
    except (OSError, json.JSONDecodeError):
        return []

    deps = data.get("dependencies", {})
    igs: list[str] = []
    for name, version in deps.items():
        if version:
            igs.append(f"{name}#{version}")
        else:
            igs.append(name)
    return igs


def build_command(
    jar_path: Path,
    resource_path: Path,
    profile_url: str,
    fhir_version: str,
) -> list[str]:
    """Construct the validator CLI command."""
    script_dir = Path(__file__).parent
    project_root = script_dir.parent.parent

    ig_dependencies = [
        str(project_root / "fsh-generated" / "resources"),
        *load_ig_dependencies(project_root),
    ]

    cmd: list[str] = [
        "java",
        "-jar",
        str(jar_path),
        str(resource_path),
        "-profile",
        profile_url,
    ]

    for ig in ig_dependencies:
        cmd.extend(["-ig", ig])

    return cmd


def run_validator(cmd: list[str], working_dir: Path) -> subprocess.CompletedProcess[str]:
    """Execute the validator command and return the completed process."""
    return subprocess.run(
        cmd,
        cwd=str(working_dir),
        capture_output=True,
        text=True,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("resource", type=Path, help="Path to the carbon copy JSON resource")
    parser.add_argument("--profile", default=DEFAULT_PROFILE, help="Canonical profile to validate against")
    parser.add_argument("--hapi-jar", default=str(DEFAULT_HAPI_JAR), help="Path to the HAPI validator JAR")
    parser.add_argument("--fhir-version", default=DEFAULT_FHIR_VERSION, help="FHIR version for validation")

    args = parser.parse_args()
    resource_path: Path = args.resource.resolve()
    jar_path = Path(args.hapi_jar).expanduser().resolve()

    if not resource_path.exists():
        print(f"❌ Error: Resource not found: {resource_path}")
        return 1

    if not jar_path.exists():
        print(f"❌ Error: HAPI validator not found: {jar_path}")
        return 1

    script_dir = Path(__file__).parent
    project_root = script_dir.parent.parent

    cmd = build_command(jar_path, resource_path, args.profile, args.fhir_version)

    print("🔍 Validating carbon copy against profile…")
    print(f"   Resource: {resource_path}")
    print(f"   Profile:  {args.profile}\n")

    result = run_validator(cmd, project_root)

    if result.stdout:
        print("📋 STDOUT:")
        print(result.stdout)

    if result.stderr:
        print("\n📋 STDERR:")
        print(result.stderr)

    if result.returncode == 0:
        print("✅ Validation successful")
        return 0

    print(f"❌ Validation failed with return code {result.returncode}")
    return result.returncode


if __name__ == "__main__":
    sys.exit(main())
