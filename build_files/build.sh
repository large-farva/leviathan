#!/usr/bin/env bash
set -euxo pipefail

echo ">>> Starting Leviathan Image Edits"

# -------------------------------------
# Theming and Icons
# -------------------------------------
mkdir -p /etc/dconf/db/local.d
mkdir -p /usr/share/themes \
         /usr/share/icons

cp -r /ctx/themes/Orchis-Grey-Dark \
      /usr/share/themes/

cp -r /ctx/icons/Tela-Nord \
      /usr/share/icons/

cat <<'EOF' > /etc/dconf/db/local.d/00_leviathan_theme
[org/gnome/desktop/interface]
gtk-theme='Orchis-Grey-Dark'
icon-theme='Tela-Nord'
color-scheme='prefer-dark'

[org/gnome/desktop/wm/preferences]
theme='Orchis-Grey-Dark'
EOF

dconf update

echo "✓ Applied Orchis-Grey-Dark & Tela-Nord system defaults"

# -------------------------------------
# Remove Unnecessary Packages
# -------------------------------------
rpm-ostree override remove \
    waydroid \
    waydroid-selinux || true

echo "✓ Removed Waydroid and Waydroid SELinux packages"

# -------------------------------------
# Remove Unwanted Preinstalled Flatpaks
# -------------------------------------
flatpak uninstall -y --system \
    io.github.nokse22.Exhibit \
    leopoldluley.Clapgrep \
    com.ranfdev.DistroShelf \
    io.github.radiolamp.mangojuice \
    com.supermodel3.Supermodel \
    org.DolphinEmu.dolphin-emu \
    org.ppsspp.PPSSPP \
    github.shiiion.primehack \
    org.libretro.RetroArch \
    net.kuribo64.melonDS \
    org.duckstation.DuckStation \
    org.scummvm.ScummVM \
    app.xemu.xemu || true

echo "✓ Removed unwanted preinstalled Flatpaks"

# -------------------------------------
# Install Flatpaks
# -------------------------------------
flatpak install -y --system \
    com.discordapp.Discord \
    com.bitwarden.desktop \
    dev.qwery.AddWater || true

echo "✓ Installed Discord, Bitwarden, Add Water via Flatpak"

# -------------------------------------
# Remove Unwanted Extensions
# -------------------------------------
rpm-ostree override remove \
    gnome-shell-extension-burn-my-windows \
    gnome-shell-extension-compiz-alike-magic-lamp-effect \
    gnome-shell-extension-compiz-window-effect \
    gnome-shell-extension-desktop-cube \
    gnome-shell-extension-hanabi-extension \
    gnome-shell-extension-hotedge \
    gnome-shell-extension-tilingshell || true

echo "✓ Removed unwanted GNOME Shell extensions"

# -------------------------------------
# Install Extensions
# -------------------------------------
rpm-ostree override install \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-dash-to-panel \
    gnome-shell-extension-app-hider \
    gnome-shell-extension-extension-list \
    gnome-shell-extension-tweaks-system-menu \
    gnome-shell-extension-unblank \
    gnome-shell-extension-vitals

echo "✓ Installed Dash to Dock, Dash to Panel, App Hider, Extension List, Tweaks System Menu, Unblank, and Vitals extensions"

systemctl enable podman.socket

echo ">>> Leviathan Edits Complete"
