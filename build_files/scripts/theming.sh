#!/usr/bin/env bash
set -euxo pipefail

: "${SRCROOT:?must be set}"
THEME_DIR="$SRCROOT/theming"

for img in "${THEME_DIR}/wallpapers/"*; do
  install -Dm0644 "$img" "/usr/share/backgrounds/$(basename "$img")"
done

for icon in "${THEME_DIR}/icons/"*; do
  name="$(basename "$icon")"
  install -d "/usr/share/icons/${name}"
  cp -r "${icon}/." "/usr/share/icons/${name}/"
done

for theme in "${THEME_DIR}/themes/"*; do
  name="$(basename "$theme")"
  install -d "/usr/share/themes/${name}"
  cp -r "${theme}/." "/usr/share/themes/${name}/"
done
