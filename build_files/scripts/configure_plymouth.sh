#!/usr/bin/env bash
set -euxo pipefail

rm -rf /usr/share/plymouth/themes/charge

: "${SRCROOT:?must be set}"

install -Dm0644 \
  "${SRCROOT}/theming/plymouth/watermark.png" \
  /usr/share/plymouth/themes/spinner/watermark.png
