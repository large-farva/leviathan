#!/usr/bin/env bash
set -ouex pipefail

echo ">>> Starting Leviathan Image Edits"

# -------------------------------------
# Remove Unnecessary Host Packages
# -------------------------------------
rpm-ostree override remove \
    waydroid \
    waydroid-selinux \
    input-remapper || true

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
    gnome-tweaks \
    gnome-extensions-app \
    chrome-gnome-shell \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-user-theme \
    gamemode \
    mangohud \
    steam-devices \
    vulkan-tools \
    xpadneo-dkms \
    zsh \
    git \
    neovim \
    htop \
    tilix \
    file-roller \
    baobab \
    lm_sensors

# -------------------------------------
# Flatpak App Installations
# -------------------------------------
flatpak install -y --system \
    com.bitwarden.desktop

systemctl enable podman.socket

echo ">>> Leviathan Edits Complete"
