#!/usr/bin/env bash
set -ouex pipefail

echo ">>> Starting Leviathan Image Edits"

# -------------------------------------
# Remove Unnecessary Host Packages
# -------------------------------------
rpm-ostree override remove \
    waydroid \
    waydroid-selinux \
    distrobox || true

# -------------------------------------
# Remove Preinstalled Flatpak Apps
# -------------------------------------
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

# -------------------------------------
# Install Essential Host Packages
# -------------------------------------
rpm-ostree install \
    gnome-shell-extension-dash-to-panel

# -------------------------------------
# Flatpak App Installations
# -------------------------------------
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --system flathub page.tesk.Refine -y
flatpak install -y --system \
    com.bitwarden.desktop

systemctl enable podman.socket

echo ">>> Leviathan Edits Complete"
