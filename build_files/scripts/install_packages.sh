#!/usr/bin/env bash
set -euxo pipefail

dnf5 install -y \
    steam \
    gnome-software \
    gnome-tweaks \
    plymouth-plugin-script || true
