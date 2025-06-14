#!/usr/bin/env bash
set -euxo pipefail

echo ">>> Removing unwanted GNOME Shell extensions"
rpm-ostree override remove \
    gnome-shell-extension-burn-my-windows \
    gnome-shell-extension-compiz-alike-magic-lamp-effect \
    gnome-shell-extension-compiz-window-effect \
    gnome-shell-extension-desktop-cube \
    gnome-shell-extension-hanabi-extension \
    gnome-shell-extension-hotedge \
    gnome-shell-extension-tilingshell || true

echo "✓ Removed unwanted GNOME Shell extensions"
