#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"


## Generate heading-links.js
"$SCRIPT_DIR/generate-heading-links-js.sh"

# Generate Sushi
sushi .

# Run scripts that need artifacts from IG Publisher
python3 "$SCRIPT_DIR/testscripts/generate-provide-prescription-docs.py"
./scripts/fml_table.sh

# Generate IG Publisher Content
./_genonce.sh -no-sushi
