#!/usr/bin/env bash
set -euxo pipefail

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --system -y \
    com.discordapp.Discord \
    dev.qwery.AddWater \
    com.spotify.Client \
    org.onlyoffice.desktopeditors || true
