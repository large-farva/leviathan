#!/usr/bin/env bash
set -euxo pipefail

/usr/bin/install -m 644 /dev/stdin /etc/dconf/db/local.d/00_leviathan <<'EOF'
[org/gnome/desktop/interface]
cursor-size=24
color-scheme='prefer-dark'
clock-show-date=true
icon-theme='Tela-nord'

[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/black-windows.jpg'

[org/gnome/desktop/wm/preferences]
focus-mode='click'
auto-raise=true

[org/gnome/shell]
enable-hot-corners=false
favorite-apps=['org.mozilla.firefox.desktop','steam.desktop','org.gnome.TextEditor.desktop','org.gnome.Nautilus.desktop','org.gnome.Calculator.desktop','gnome-software.desktop','gnome-control-center.desktop']
enabled-extensions=['dash-to-panel@jderose9.github.com','app-hider@lynith.dev','extension-list@tu.berry','vitals@CoreCoding.com','appindicatorsupport@rgcjonas.gmail.com','blur-my-shell@aunetx','caffeine@patapon.info','just-perfection-desktop@just-perfection','logomenu@aryan_k','user-theme@gnome-shell-extensions.gcampax.github.com']

[org/gnome/shell/extensions/user-theme]
name='Leviathan'

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
