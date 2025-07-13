#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

BUILD_FILES_DIR="${SCRIPT_DIR}/build_files"

: "${FLAVOR:?Environment variable FLAVOR must be set to one of your flavor dirs}"
FLAVOR_DIR="${BUILD_FILES_DIR}/${FLAVOR}"
SHARED_DIR="${BUILD_FILES_DIR}/shared"

if [ ! -d "$FLAVOR_DIR" ]; then
  echo "ERROR: no such flavor directory: $FLAVOR_DIR" >&2
  exit 1
fi

for script in "$SHARED_DIR"/*.sh; do
  echo "==> running shared: $(basename "$script")"
  bash "$script"
done

for script in "$FLAVOR_DIR"/*.sh; do
  echo "==> running $FLAVOR: $(basename "$script")"
  bash "$script"
done
