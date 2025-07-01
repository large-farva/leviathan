#!/usr/bin/env bash
set -euxo pipefail

echo "Applying system theming..."

# Install background image
install -Dm644 "$REPO_FILES_DIR/backgrounds/Leviathan.png" /usr/share/backgrounds/Leviathan.png

# Install icon theme
cp -r "$REPO_FILES_DIR/icons/Tela-nord" /usr/share/icons/Tela-nord

# Install GTK and Shell theme
cp -r "$REPO_FILES_DIR/themes/Leviathan" /usr/share/themes/Leviathan

echo "System theming applied successfully."
