#!/bin/bash

set -ouex pipefail

# dnf5 install -y

# Remove list
#     gnome-help
#     ryujinx

rpm-ostree override remove \
    waydroid \
    waydroid-selinux \
    input-remapper \
    lutris

flatpak uninstall -y --system \
    com.supermodel3.Supermodel \
    org.DolphinEmu.dolphin-emu \
    org.ppsspp.PPSSPP \
    github.shiiion.primehack \
    org.libretro.RetroArch \
    net.kuribo64.melonDS \
    org.duckstation.DuckStation \
    org.scummvm.ScummVM \
    app.xemu.xemu || true

flatpak install -y --system \
    com.bitwarden.desktop

systemctl enable podman.socket
