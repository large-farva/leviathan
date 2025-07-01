#!/usr/bin/env bash
set -euxo pipefail

echo "Replacing Plymouth BGRT watermark logo..."

install -Dm644 "$REPO_FILES_DIR/plymouth/watermark.png" /usr/share/plymouth/themes/bgrt/watermark.png

plymouth-set-default-theme -R bgrt

echo "BGRT Plymouth logo replaced successfully."
