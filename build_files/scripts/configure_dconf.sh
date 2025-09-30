#!/usr/bin/env bash
set -euxo pipefail

/usr/bin/install -m 644 /dev/stdin /etc/dconf/db/local.d/00_leviathan <<'EOF'
[org/gnome/desktop/interface]
cursor-size=24
color-scheme='prefer-dark'
clock-show-date=true

[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/Leviathan.png'
picture-uri-dark='file:///usr/share/backgrounds/leviathan-dark.png'

[org/gnome/desktop/wm/preferences]
focus-mode='click'
auto-raise=true

[org/gnome/shell]
enable-hot-corners=false
favorite-apps=['org.mozilla.firefox.desktop','steam.desktop','org.gnome.TextEditor.desktop','org.gnome.Nautilus.desktop','org.gnome.Calculator.desktop','gnome-software.desktop','gnome-control-center.desktop']
enabled-extensions=['dash-to-panel@jderose9.github.com','app-hider@lynith.dev','blur-my-shell@aunetx','caffeine@patapon.info','just-perfection-desktop@just-perfection','logomenu@aryan_k','user-theme@gnome-shell-extensions.gcampax.github.com']

[org/gnome/nautilus/preferences]
sort-directories-first=true
EOF

/usr/bin/install -m 644 /dev/stdin /etc/dconf/db/gdm.d/00_gdm_background <<'EOF'
[org/gnome/desktop/background]
picture-uri='file:///usr/share/gnome-shell/theme/background.png'
EOF

dconf update
#!/usr/bin/env bash
set -euxo pipefail

/usr/bin/install -m 644 /dev/stdin /etc/dconf/db/local.d/00_leviathan <<'EOF'
[org/gnome/desktop/interface]
cursor-size=24
color-scheme='prefer-dark'
clock-show-date=true

[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/leviathan.png'
picture-uri-dark='file:///usr/share/backgrounds/leviathan-dark.png'

[org/gnome/desktop/wm/preferences]
focus-mode='click'
auto-raise=true

[org/gnome/shell]
enable-hot-corners=false
favorite-apps=['org.mozilla.firefox.desktop','steam.desktop','org.gnome.TextEditor.desktop','org.gnome.Nautilus.desktop','org.gnome.Calculator.desktop','gnome-software.desktop']
enabled-extensions=['dash-to-panel@jderose9.github.com','blur-my-shell@aunetx','caffeine@patapon.info','just-perfection-desktop@just-perfection','user-theme@gnome-shell-extensions.gcampax.github.com','arcmenu@arcmenu.com']

[org/gnome/shell/extensions/arcmenu]
menu-layout='Pop'
arc-menu-icon='view-app-grid-symbolic'
arc-menu-button-appearance='Icon'
arc-menu-icon-size=40
show-applications-button=false
pinned-app-list=['org.mozilla.firefox.desktop','org.gnome.Nautilus.desktop','org.gnome.TextEditor.desktop','steam.desktop','org.onlyoffice.desktop']

[org/gnome/shell/extensions/dash-to-panel]
panel-position='BOTTOM'
taskbar-position='CENTERED'
show-appmenu=false
show-activities-button=false
intellihide=false
panel-element-positions='{"AUO-0x00000000":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"dateMenu","visible":true,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"centered"},{"element":"taskbar","visible":true,"position":"centered"},{"element":"centerBox","visible":true,"position":"centered"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'

[org/gnome/nautilus/preferences]
sort-directories-first=true
EOF

/usr/bin/install -m 644 /dev/stdin /etc/dconf/db/gdm.d/00_gdm_background <<'EOF'
[org/gnome/desktop/background]
picture-uri='file:///usr/share/gnome-shell/theme/background.png'
EOF

dconf update
