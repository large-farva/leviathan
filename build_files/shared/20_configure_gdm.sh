#!/usr/bin/env bash
set -euxo pipefail

echo "Configuring GDM login screen background..."

install -Dm644 "$REPO_FILES_DIR/gdm/background.png" /usr/share/gnome-shell/theme/background.png

dconf update || true

echo "GDM configuration completed."
