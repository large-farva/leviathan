#!/usr/bin/env bash
set -euxo pipefail

BUILD_ROOT="$(cd "$(dirname "$0")" && pwd)"
FLAVOR="${FLAVOR:-leviathan}"
FLAVOR_DIR="$BUILD_ROOT/build_files/$FLAVOR"
export REPO_FILES_DIR="$BUILD_ROOT/repo_files"

if [ ! -d "$FLAVOR_DIR" ]; then
  echo "Error: Flavor directory '$FLAVOR_DIR' not found!" >&2
  exit 1
fi

echo "Running build for flavor: $FLAVOR"

for scr in "$FLAVOR_DIR"/*.sh; do
  [ -x "$scr" ] && "$scr"
done
