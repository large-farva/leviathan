#!/usr/bin/env bash
set -euxo pipefail

rpm-ostree override remove \
    nautilus-gsconnect \
    tailscale \
    tmux \
    gnome-backgrounds \
    gnome-backgrounds-extra || true
