#!/usr/bin/env bash
set -euxo pipefail

dnf5 install -y \
    steam \
    gnome-software \
    plymouth-plugin-script || true
