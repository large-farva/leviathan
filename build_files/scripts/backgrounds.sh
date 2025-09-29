#!/usr/bin/env bash
set -euxo pipefail

: "${SRCROOT:?must be set}"
THEME_DIR="$SRCROOT/theming"

for img in "${THEME_DIR}/backgrounds/"*; do
  install -Dm0644 "$img" "/usr/share/backgrounds/$(basename "$img")"
done
