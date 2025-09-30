#!/usr/bin/env bash
set -euxo pipefail

rpm-ostree override remove \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-logo-menu \
    gnome-shell-extension-search-light \
    gnome-shell-extension-tailscale-gnome-qs || true