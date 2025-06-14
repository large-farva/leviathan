#!/usr/bin/env bash
set -euxo pipefail

rpm-ostree override remove \
    waydroid \
    waydroid-selinux \
    google-noto-fonts-all || true
