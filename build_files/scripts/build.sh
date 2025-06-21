#!/usr/bin/env bash
set -euxo pipefail

# 0. Locate our scripts directory
SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"

# 0.1 Derive the repo root (so branding.sh can find /branding)
export SRCROOT="$(cd "${SCRIPTS_DIR}/../.." && pwd)"

# 1. Remove unwanted RPM packages
"$SCRIPTS_DIR/remove_packages.sh"

# 2. Remove unwanted Flatpaks
"$SCRIPTS_DIR/remove_flatpaks.sh"

# 3. Install RPM packages
"$SCRIPTS_DIR/install_packages.sh"

# 4. Install Flatpaks
"$SCRIPTS_DIR/install_flatpaks.sh"

# 5. Remove unwanted GNOME Shell extensions
"$SCRIPTS_DIR/remove_extensions.sh"

# 6. Install GNOME Shell extensions
"$SCRIPTS_DIR/install_extensions.sh"

# 7. Apply all dconf/GNOME settings (wallpaper, theme defaults, favorites, etc.)
"$SCRIPTS_DIR/configure_dconf.sh"

# 8. Copy in all your branding assets (wallpapers, icons, GTK/Shell themes)
"$SCRIPTS_DIR/branding.sh"
