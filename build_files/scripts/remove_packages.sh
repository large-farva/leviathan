#!/usr/bin/env bash
set -euxo pipefail

rpm-ostree override remove \
    default-fonts-* \
    google-noto-* \
    urw-base35-* || true

rpm-ostree override remove \
    waydroid* || true

rpm-ostree override remove \
    f42-backgrounds-base \
    f42-backgrounds-gnome \
    desktop-backgrounds-gnome \
    fedora-workstation-backgrounds \
    steamdeck-backgrounds || true
