#!/usr/bin/env bash
set -euxo pipefail

SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"

# 1. remove un-wanted packages
"$SCRIPTS_DIR/remove_packages.sh"

# 2. remove un-wanted Flatpaks
"$SCRIPTS_DIR/remove_flatpaks.sh"

# 3. install packages
"$SCRIPTS_DIR/install_packages.sh"

# 4. install Flatpaks
"$SCRIPTS_DIR/install_flatpaks.sh"

# 5. remove un-wanted GNOME shell extensions
"$SCRIPTS_DIR/remove_extensions.sh"

# 6. install GNOME shell extensions
"$SCRIPTS_DIR/install_extensions.sh"

# 7. apply dconf settings
"$SCRIPTS_DIR/configure_dconf.sh"
