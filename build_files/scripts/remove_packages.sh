#!/usr/bin/env bash
set -euxo pipefail

rpm-ostree override remove \
    abattis* \
    cockpit* \
    default-fonts-* \
    desktop-backgrounds-gnome \
    f42-backgrounds* \
    fedora-bookmarks \
    fedora-chromium-config \
    fedora-chromium-config-gnome \
    fedora-workstation-backgrounds \
    gnome-backgrounds \
    google-noto-* \
    mangohud* \
    paktype* \
    rit* \
    sil* \
    steamdeck-backgrounds \
    stix* \
    urw-base35-* \
    vazirmatn \
    vim* \
    waydroid* || true
