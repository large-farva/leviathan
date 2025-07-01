#!/usr/bin/env bash
set -euxo pipefail

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --system -y \
    com.google.Chrome \
    com.discordapp.Discord \
    com.bitwarden.desktop \
    com.spotify.Client \
    org.gnome.gitlab.somas.Apostrophe \
    com.ranfdev.DistroShelf \
    com.github.unrud.VideoDownloader \
    org.gnome.Boxes \
    de.haeckerfelix.Fragments \
    com.github.marhkb.Pods || true
