#!/usr/bin/env bash
set -euxo pipefail

echo ">>> Installing GNOME Shell extensions from uBlue staging"

dnf5 install -y \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-dash-to-panel || true

echo "✓ Installed new GNOME Shell extensions"
