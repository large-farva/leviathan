#!/usr/bin/env bash
set -euxo pipefail

echo ">>> Starting Leviathan Image Edits"

# -------------------------------------
# Remove Unwanted Packages
# -------------------------------------
rpm-ostree override remove \
    waydroid \
    waydroid-selinux || true

echo "✓ Removed Waydroid and Waydroid SELinux packages"

# -------------------------------------
# Prepare Flatpak Environment
# -------------------------------------
# export FLATPAK_DISABLE_SANDBOX=1
# mkdir -p /var/roothome
# export HOME=/var/roothome

# -------------------------------------
# Remove Unwanted Preinstalled Flatpaks
# -------------------------------------
flatpak uninstall -y --system \
    de.leopoldluley.Clapgrep \
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
# Install Flatpaks (disable sandbox properly)
# -------------------------------------
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --system -y \
    com.visualstudio.code \
    com.discordapp.Discord \
    com.bitwarden.desktop \
    dev.qwery.AddWater || true

echo "✓ Installed VS Code, Discord, Bitwarden & Add Water via Flatpak"

# -------------------------------------
# Remove Unwanted GNOME Shell Extensions
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
# Install GNOME Shell Extensions (Fedora 42 staging)
# -------------------------------------
curl -s \
  https://copr.fedorainfracloud.org/coprs/ublue-os/staging/repo/fedora-42/ublue-os-staging.repo \
  -o /etc/yum.repos.d/ublue-os-staging.repo

dnf5 install -y --skip-unavailable \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-dash-to-panel \
    gnome-shell-extension-app-hider \
    gnome-shell-extension-extension-list \
    gnome-shell-extension-tweaks-system-menu \
    gnome-shell-extension-unblank \
    gnome-shell-extension-vitals || true

echo "✓ Installed GNOME Shell extensions"

# -------------------------------------
# Dconf Configuration
# -------------------------------------
cat <<'EOF' > /etc/dconf/db/local.d/00_leviathan_theme
[org/gnome/desktop/interface]
cursor-size=24
color-scheme='prefer-dark'
clock-show-date=true

[org/gnome/desktop/wm/preferences]
focus-mode='click'
auto-raise=true

[org/gnome/shell]
enable-hot-corners=false
favorite-apps=['org.mozilla.firefox.desktop','steam.desktop','org.gnome.TextEditor.desktop','org.gnome.Nautilus.desktop','org.gnome.Calculator.desktop','gnome-software.desktop','gnome-control-center.desktop']
enabled-extensions=['dash-to-panel@jderose9.github.com','app-hider@lynith.dev','extension-list@tu.berry','vitals@CoreCoding.com','appindicatorsupport@rgcjonas.gmail.com','blur-my-shell@aunetx','caffeine@patapon.info','just-perfection-desktop@just-perfection','logomenu@aryan_k','user-theme@gnome-shell-extensions.gcampax.github.com']

[org/gnome/shell/extensions/dash-to-panel]
panel-position='BOTTOM'
panel-fixed=true
panel-size=36
icon-size=32
show-apps-at-top=true
click-action='minimize'

[org/gnome/shell/extensions/dash-to-dock]
dock-position='BOTTOM'
dock-fixed-size=true
dash-max-icon-size=48
intellihide=true
background-opacity=0.8
running-indicator-style='DOTS'
click-action='minimize'

[org/gnome/nautilus/preferences]
show-hidden-files=true
sort-directories-first=true
EOF

dconf update

echo "✓ Applied theming & dconf settings"
echo ">>> Leviathan Edits Complete"
