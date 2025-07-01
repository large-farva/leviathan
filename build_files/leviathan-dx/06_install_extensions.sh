#!/usr/bin/env bash
set -euxo pipefail

dnf5 install -y \
    gnome-shell-extension-dash-to-panel || true
