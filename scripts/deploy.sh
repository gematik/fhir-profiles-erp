#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Error handling: The script will terminate on error.
set -e

. "$(dirname "$0")/config.sh"

# Check MODE
if [ -z "$ENVIRONMENT" ]; then
  echo "❌ Error: ENVIRONMENT variable not set. Use 'DEV' or 'PROD'."
  exit 1
fi

# Check GCloud Login 

# Function: Check if gcloud is authenticated and credentials are valid
function gcloud_is_authenticated() {
  ACCOUNT=$(gcloud auth list --filter=status:ACTIVE --format="value(account)")
  if [ -z "$ACCOUNT" ]; then
    return 1
  fi
  # Try a simple gcloud command to verify credentials are valid (e.g., list projects)
  if ! gcloud projects list --limit=1 > /dev/null 2>&1; then
    return 1
  fi
  return 0
}

if gcloud_is_authenticated; then
  echo "✅ Already authenticated with gcloud and credentials are valid."
else
  echo "No valid gcloud authentication found. Trying authentication..."

  gcloud auth login
fi

BUCKET_NAME="$PROD_BUCKET"

# Set BUCKET_PATH based on ENVIRONMENT and validate LABEL accordingly
if [ "$ENVIRONMENT" = "DEV" ]; then
  BUCKET_PATH="$DEV_BUCKET_PATH"
  if [ "$LABEL" != "ci-build" ]; then
    echo "❌ Error: For ENVIRONMENT 'DEV', LABEL must be 'ci-build'."
    exit 1
  fi
  if [[ ! "$TARGET" =~ -draft$ ]]; then
    echo "❌ Error: For ENVIRONMENT 'DEV', TARGET must end with '-draft'."
    exit 1
  fi
elif [ "$ENVIRONMENT" = "BALLOT" ]; then
  if [[ ! "$TARGET" =~ -ballot[0-9]+$ ]]; then
    echo "❌ Error: TARGET must end with '-ballot' followed by a number (e.g., -ballot1)."
    exit 1
  fi
  BUCKET_PATH="$BALLOT_BUCKET_PATH"
  if [ "$LABEL" != "ballot" ]; then
    echo "❌ Error: For ENVIRONMENT 'BALLOT', LABEL must be 'ballot'."
    exit 1
  fi
elif [ "$ENVIRONMENT" = "PROD" ]; then
  BUCKET_PATH="$PROD_BUCKET_PATH"
  if [ "$LABEL" != "release" ]; then
    echo "❌ Error: For ENVIRONMENT 'PROD', LABEL must be 'release'."
    exit 1
  fi
  if [[ ! "$TARGET" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "❌ Error: For ENVIRONMENT 'PROD', TARGET must be a SemVer string like 'x.y.z' with nothing after 'z'."
    exit 1
  fi
else
  echo "❌ Error: ENVIRONMENT must be either 'DEV', 'BALLOT' or 'PROD'."
  exit 1
fi

# At this point, BUCKET_PATH is set, and LABEL has been validated.


echo "✅ ENVIRONMENT: ${ENVIRONMENT}"
echo "✅ TARGET PATH: ${BUCKET_NAME}${BUCKET_PATH}/${TARGET}"
if [ -n "$PREV" ]; then
  echo "✅ PREV PATH: ${BUCKET_NAME}${BUCKET_PATH}/${PREV}"
fi

echo "✅ PUBLISH_URL: ${PUBLISH_URL}"

# TODO Add Simplifier cli

"$SCRIPT_DIR/build-ig.sh"
 

if gsutil ls gs://$BUCKET_NAME$BUCKET_PATH/$TARGET > /dev/null 2>&1; then
    echo "TARGET directory already exists: ${TARGET}"
    if [ -n "$PREV" ]; then
        echo "Moving TARGET to PREV: ${PREV}"
        gcloud storage mv gs://$BUCKET_NAME$BUCKET_PATH/$TARGET gs://$BUCKET_NAME$BUCKET_PATH/$PREV
    fi
    echo "Deleting existing TARGET: $TARGET"
    gcloud storage rm --recursive gs://$BUCKET_NAME$BUCKET_PATH/$TARGET
else
    echo "TARGET directory does not exist"
fi

echo "Uploading new version to TARGET: ${TARGET}"
# gcloud storage cp --recursive --cache-control="no-cache" ./output/ gs://$BUCKET_NAME$BUCKET_PATH/$TARGET
gsutil -m -h "Cache-Control:no-cache" cp -r ./output/* gs://$BUCKET_NAME$BUCKET_PATH/$TARGET/

echo "Successfully published on https://gemspec.gematik.de${BUCKET_PATH}/${TARGET}"