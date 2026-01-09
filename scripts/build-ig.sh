#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"


## Generate heading-links.js
"$SCRIPT_DIR/generate-heading-links-js.sh"

igtools process

# Generate Sushi
sushi .

# Generate Transformed Artifacts by StructureMaps
if [ -n "$(ls -A input/resources/transformed-kbv-bundles/ 2>/dev/null)" ]; then
  rm input/resources/transformed-kbv-bundles/*
fi
python3 "$SCRIPT_DIR/testscripts/generate-provide-prescription-docs.py"

# Generate Images from drawio
"$SCRIPT_DIR/generate-drawio-images.sh"

# Generate Markdown Tables for StructureMaps
./scripts/fml_table.sh

# Generate IG Publisher Content
./_genonce.sh -no-sushi

#TODO Determine if we should use this and offer to download
./scripts/package-custom-artifacts.sh