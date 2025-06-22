#!/usr/bin/env bash
set -euxo pipefail

: "${SRCROOT:?must be set}"
THEME=sleek
SRC="${SRCROOT}/theming/grub/${THEME}"
DST="/boot/grub2/themes/${THEME}"

install -d "${DST}"
cp -r "${SRC}/." "${DST}/"

if grep -q '^GRUB_THEME=' /etc/default/grub; then
  sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"${DST}/theme.txt\"|" /etc/default/grub
else
  printf '\nGRUB_THEME="%s/theme.txt"\n' "${DST}" >> /etc/default/grub
fi

grub2-mkconfig -o /boot/grub2/grub.cfg
