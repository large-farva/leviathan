#!/usr/bin/env bash
set -euxo pipefail

: "${SRCROOT:?must be set}"

install -d /usr/share/gnome-shell/theme

install -Dm0644 "${SRCROOT}/theming/backgrounds/leviathan.png" /usr/share/gnome-shell/theme/background.png
