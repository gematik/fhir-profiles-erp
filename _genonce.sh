#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

publisher_jar="publisher.jar"
input_cache_path="./input-cache"
tx_args=()

echo "Checking internet connection..."
if curl -sSf tx.fhir.org >/dev/null 2>&1; then
  echo "Online"
else
  echo "Offline"
  tx_args+=("-tx" "n/a")
fi

export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Dfile.encoding=UTF-8"

publisher="$input_cache_path/$publisher_jar"
if [ -f "$publisher" ]; then
  java -jar "$publisher" -ig . "${tx_args[@]}" "$@"
else
  publisher="../$publisher_jar"
  if [ -f "$publisher" ]; then
    java -jar "$publisher" -ig . "${tx_args[@]}" "$@"
  else
    echo "IG Publisher NOT FOUND in input-cache or parent folder. Please run _updatePublisher. Aborting..." >&2
    exit 1
  fi
fi
