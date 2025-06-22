#!/usr/bin/env bash
set -euxo pipefail

/usr/bin/install -m 644 /dev/stdin /etc/dconf/db/local.d/00_leviathan <<'EOF'
[org/gnome/desktop/interface]
cursor-size=24
color-scheme='prefer-dark'
clock-show-date=true
icon-theme='Tela-nord'
gtk-theme='Leviathan'

[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/Leviathan.png'

[org/gnome/desktop/wm/preferences]
focus-mode='click'
auto-raise=true

[org/gnome/shell]
enable-hot-corners=false
favorite-apps=['org.mozilla.firefox.desktop','steam.desktop','org.gnome.TextEditor.desktop','org.gnome.Nautilus.desktop','org.gnome.Calculator.desktop','gnome-software.desktop','gnome-control-center.desktop']
enabled-extensions=['dash-to-panel@jderose9.github.com','app-hider@lynith.dev','extension-list@tu.berry','vitals@CoreCoding.com','appindicatorsupport@rgcjonas.gmail.com','blur-my-shell@aunetx','caffeine@patapon.info','just-perfection-desktop@just-perfection','logomenu@aryan_k','user-theme@gnome-shell-extensions.gcampax.github.com']

[org/gnome/shell/extensions/user-theme]
name='Leviathan'

[org/gnome/nautilus/preferences]
show-hidden-files=true
sort-directories-first=true
EOF

/usr/bin/install -m 644 /dev/stdin /etc/dconf/db/gdm.d/00_gdm_background <<'EOF'
[org/gnome/desktop/background]
picture-uri='file:///usr/share/gnome-shell/theme/background.png'
EOF

dconf update
