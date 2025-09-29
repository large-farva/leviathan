#!/usr/bin/env bash
set -euxo pipefail

rpm-ostree override remove \
    # Bazzite Base
    # gnome-shell-extension-burn-my-windows \
    # gnome-shell-extension-compiz-alike-magic-lamp-effect \
    # gnome-shell-extension-compiz-window-effect \
    # gnome-shell-extension-desktop-cube \
    # gnome-shell-extension-hanabi \
    # gnome-shell-extension-hotedge \
    # gnome-shell-extension-tilingshell || true
    # Bluefin Base
    gnome-shell-extension-appindicator \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-gsconnect \
    gnome-shell-extension-logo-menu \
    gnome-shell-extension-search-light \
    gnome-shell-extension-tailscale-gnome-qs || true