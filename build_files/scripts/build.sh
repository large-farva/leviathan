#!/usr/bin/env bash
set -euxo pipefail

SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"
export SRCROOT="$(cd "${SCRIPTS_DIR}/../.." && pwd)"

"$SCRIPTS_DIR/remove_packages.sh"
"$SCRIPTS_DIR/remove_flatpaks.sh"
"$SCRIPTS_DIR/remove_extensions.sh"

"$SCRIPTS_DIR/install_packages.sh"
"$SCRIPTS_DIR/install_flatpaks.sh"
"$SCRIPTS_DIR/install_extensions.sh"

"$SCRIPTS_DIR/branding.sh"

"$SCRIPTS_DIR/configure_dconf.sh"
