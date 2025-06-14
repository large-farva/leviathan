#!/usr/bin/env bash
set -euxo pipefail

dnf5 install -y \
    cosign \
    cascadia-mono-nf-fonts || true
