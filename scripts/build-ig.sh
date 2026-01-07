#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"


## Generate heading-links.js
"$SCRIPT_DIR/generate-heading-links-js.sh"



igtools process

# Generate Sushi
sushi .

# Run scripts that need artifacts from IG Publisher
# if [ -n "$(ls -A input/resources/transformed-kbv-bundles/ 2>/dev/null)" ]; then
#   rm input/resources/transformed-kbv-bundles/*
# fi
#python3 "$SCRIPT_DIR/testscripts/generate-provide-prescription-docs.py"
./scripts/fml_table.sh

# Generate IG Publisher Content
./_genonce.sh -no-sushi
