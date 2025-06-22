#!/usr/bin/env bash
set -euxo pipefail

: "${SRCROOT:?must be set}"

install -d /usr/share/gnome-shell/theme
install -Dm0644 \
  "${SRCROOT}/theming/themes/Leviathan/gnome-shell/gnome-shell.css" \
  /usr/share/gnome-shell/theme/gdm.css
cp -r "${SRCROOT}/theming/themes/Leviathan/gnome-shell/"*.{png,svg} \
  /usr/share/gnome-shell/theme/ || true

/usr/bin/install -Dm0644 \
  "${SRCROOT}/theming/gdm/background.png" \
  /usr/share/gnome-shell/theme/background.png
