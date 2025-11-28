SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Pre Sushi Logic

## Generate heading-links.js
"$SCRIPT_DIR/generate-heading-links-js.sh"

# Generate Sushi
sushi .

# Run scripts that need artifacts from IG Publisher
./scripts/fml_table.sh

# Generate IG Publisher Content
./_genonce.sh -no-sushi
