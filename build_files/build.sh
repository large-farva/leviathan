#!/usr/bin/env bash

# I changed the pipefall orddr.
set -euxo pipefail

echo ">>> Starting Leviathan Image Edits"

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
    com.visualstudio.code \
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

# -------------------------------------
# Theming, Icons, and Wallpaper
# -------------------------------------
mkdir -p /etc/dconf/db/local.d
mkdir -p /usr/share/themes \
         /usr/share/icons

cp -r /ctx/build_files/themes/Orchis-Grey-Dark \
    /usr/share/themes/

cp -r /ctx/build_files/icons/Tela-Nord \
    /usr/share/icons/

cp -r /ctx/build_files/icons/Bibata-Modern-Ice \
    /usr/share/icons/

cp -r /ctx/build_files/backgrounds/black-white.jpg \
    /usr/share/backgrounds/

# -------------------------------------
# Dconf Configuration
# -------------------------------------
cat <<'EOF' > /etc/dconf/db/local.d/00_leviathan_theme

[org/gnome/desktop/interface]
gtk-theme='Orchis-Grey-Dark'
icon-theme='Tela-Nord'
cursor-theme='Bibata-Modern-Ice'
cursor-size=24
color-scheme='prefer-dark'
clock-show-date=true

[org/gnome/desktop/wm/preferences]
theme='Orchis-Grey-Dark'
focus-mode='click'
auro-raise=true

[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/black-white.jpg'
picture-options='zoom'

[org/gnome/shell]
enable-hot-corners=false
favorite-apps=[
  'org.mozilla.firefox.desktop',
  'steam.desktop',
  'org.gnome.TextEditor.desktop',
  'org.gnome.Nautilus.desktop',
  'org.gnome.Calculator.desktop',
  'gnome-software.desktop',
  'gnome-control-center.desktop'
]

enabled-extensions=[
    'dash-to-panel@jderose9.github.com',
    'app-hider@lynith.dev',
    'extension-list@tu.berry',
    'Vitals@CoreCoding.com',
    'appindicatorsupport@rgcjonas.gmail.com',
    'blur-my-shell@aunetx',
    'caffeine@patapon.info',
    'just-perfection-desktop@just-perfection',
    'logomenu@aryan_k',
    'user-theme@gnome-shell-extensions.gcampax.github.com'
]

# ─── Dash-to-Panel defaults ───
[org/gnome/shell/extensions/dash-to-panel]
panel-position='BOTTOM'
panel-fixed=true
panel-size=36
icon-size=32
show-apps-at-top=true
click-action='minimize'
middle-click-action='launch-new-instance'
shift-click-action='switch-or-launch'
intellihide-fixed=true
auto-hide=false
multimonitor=false
running-indicator-style='DOTS'

# ─── Dash-to-Dock defaults ───
[org/gnome/shell/extensions/dash-to-dock]
dock-position='BOTTOM'
dock-fixed-size=true
intellihide=true
intellihide-mode='AUTOMATIC'
dock-size=48
dock-max-icon-size=46
dock-show-apps-at-top=true
dock-show-trash=true
dock-show-mounts=false
background-opacity=0.9
running-indicator-style='DOTS'
click-action='minimize'

[org/gnome/nautilus/preferences]
show-hidden-files=true
sort-directories-first=true

EOF

dconf update

echo "✓ Applied theming and dconf settings"

systemctl enable podman.socket

echo ">>> Leviathan Edits Complete"