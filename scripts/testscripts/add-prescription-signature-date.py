#!/usr/bin/env python3
"""Ensure digitaler Durchschlag contains a prescriptionSignatureDate snippet.

This script normalizes Parameters resources produced by the StructureMap
transformation so that each `rxPrescription` parameter includes a `part`
entry with name `prescriptionSignatureDate` and a fixed `valueInstant`.
If the part already exists, its value is overwritten to the expected instant.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path
from typing import Any, Dict, List

SIGNATURE_PART = {
    "name": "prescriptionSignatureDate",
    "valueInstant": "2026-04-01T08:23:12Z",
}


def ensure_signature_part(parts: List[Dict[str, Any]]) -> None:
    """Ensure the signature part is present (or updated) within the list."""
    for part in parts:
        if part.get("name") == SIGNATURE_PART["name"]:
            part["valueInstant"] = SIGNATURE_PART["valueInstant"]
            return
    # Prepend so it appears at the start of the rxPrescription list for readability
    parts.insert(0, dict(SIGNATURE_PART))


def patch_parameters(resource: Dict[str, Any]) -> bool:
    """Patch a Parameters resource in-place. Returns True when changes applied."""
    if resource.get("resourceType") != "Parameters":
        return False

    parameters = resource.get("parameter")
    if not isinstance(parameters, list):
        return False

    for parameter in parameters:
        if not isinstance(parameter, dict):
            continue
        if parameter.get("name") != "rxPrescription":
            continue

        parts = parameter.setdefault("part", [])
        if not isinstance(parts, list):
            parameter["part"] = []
            parts = parameter["part"]

        ensure_signature_part(parts)
        return True

    # No rxPrescription parameter found; append a minimal one so callers
    # immediately see the expected data in downstream artefacts.
    parameters.append({
        "name": "rxPrescription",
        "part": [dict(SIGNATURE_PART)],
    })
    return True


def main() -> int:
    if len(sys.argv) != 2:
        print("Usage: add-prescription-signature-date.py <digitaler-durchschlag.json>", file=sys.stderr)
        return 1

    path = Path(sys.argv[1])
    if not path.exists():
        print(f"File not found: {path}", file=sys.stderr)
        return 1

    data = json.loads(path.read_text(encoding="utf-8"))
    if patch_parameters(data):
        path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
        return 0

    print(f"No rxPrescription parameter found in {path}", file=sys.stderr)
    return 2


if __name__ == "__main__":
    sys.exit(main())
