#!/usr/bin/env bash
set -euxo pipefail

rpm-ostree override remove \
    abattis* \
    default-fonts-* \
    desktop-backgrounds-gnome \
    f42-backgrounds* \
    fedora-bookmarks \
    fedora-chromium-config \
    fedora-chromium-config-gnome \
    fedora-workstation-backgrounds \
    gnome-backgrounds \
    google-noto-* \
    jetbrains-mono-fonts-all \
    paktype* \
    rit* \
    sil* \
    stix* \
    tmux \
    urw-base35-* \
    vazirmatn \
    vim* \
    waydroid* \
    yaru-theme || true
