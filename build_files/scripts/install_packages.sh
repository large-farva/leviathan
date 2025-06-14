#!/usr/bin/env bash
set -euxo pipefail

echo ">>> Installing essential host packages"
dnf5 install -y \
    cosign \
    cascadia-mono-nf-fonts || true

echo "✓ Installed host packages"
