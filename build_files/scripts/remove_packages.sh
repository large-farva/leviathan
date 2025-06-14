#!/usr/bin/env bash
set -euxo pipefail

echo ">>> Removing unwanted host packages"
rpm-ostree override remove \
    waydroid \
    waydroid-selinux \
    google-noto-fonts-all || true

echo "✓ Removed Waydroid & Waydroid-SELinux"
