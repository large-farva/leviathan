#!/usr/bin/env bash
set -euxo pipefail

: "${SRCROOT:?must be set}"

BRAND_DIR="${SRCROOT}/branding"

echo "==> Installing wallpapers"
for img in "${BRAND_DIR}/wallpapers/"*; do
  install -Dm0644 \
    "$img" \
    "/usr/share/backgrounds/$(basename "$img")"
done

echo "==> Installing icon themes"
for icon in "${BRAND_DIR}/icons/"*; do
  name="$(basename "$icon")"
  install -d "/usr/share/icons/${name}"
  cp -r "${icon}/." "/usr/share/icons/${name}/"
done

echo "==> Installing GTK & Shell themes"
for theme in "${BRAND_DIR}/themes/"*; do
  name="$(basename "$theme")"
  install -d "/usr/share/themes/${name}"
  cp -r "${theme}/." "/usr/share/themes/${name}/"
done
