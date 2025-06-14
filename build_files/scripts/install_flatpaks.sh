#!/usr/bin/env bash
set -euxo pipefail

echo ">>> Adding Flathub & installing Flatpaks"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --system -y \
    com.google.Chrome \
    com.visualstudio.code \
    com.discordapp.Discord \
    com.bitwarden.desktop \
    dev.qwery.AddWater \
    com.spotify.Client || true

echo "✓ Installed VS Code, Discord, Bitwarden & Add Water"
