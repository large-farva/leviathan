#!/usr/bin/env bash
set -euxo pipefail

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --system -y \
    com.google.Chrome \
    com.visualstudio.code \
    com.discordapp.Discord \
    com.bitwarden.desktop \
    dev.qwery.AddWater \
    com.spotify.Client \
    io.gitlab.adhami3310.Impression \
    de.haeckerfelix.Fragments \
    me.iepure.devtoolbox || true
