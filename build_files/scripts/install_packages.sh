#!/usr/bin/env bash
set -euxo pipefail

dnf5 install -y \
    cosign || true

 dnf install  -y \
    adwaita-fonts-all || true
