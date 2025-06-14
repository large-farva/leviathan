#!/usr/bin/env bash
set -euxo pipefail

SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ">>> Starting Leviathan image edits"

# 1. remove cruft from rpm-ostree
"$SCRIPTS_DIR/remove_packages.sh"

# 2. remove unwanted Flatpaks
"$SCRIPTS_DIR/remove_flatpaks.sh"

# 3. install any rpm-ostree packages you need
"$SCRIPTS_DIR/install_packages.sh"

# 4. add desired Flatpaks
"$SCRIPTS_DIR/install_flatpaks.sh"

# 5. remove un-wanted GNOME shell extensions
"$SCRIPTS_DIR/remove_extensions.sh"

# 6. install your GNOME shell extensions
"$SCRIPTS_DIR/install_extensions.sh"

# 7. apply all your dconf tweaks
"$SCRIPTS_DIR/configure_dconf.sh"

echo ">>> Leviathan edits complete"
