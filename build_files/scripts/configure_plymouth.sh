#!/usr/bin/env bash
set -euxo pipefail

: "${SRCROOT:?must be set}"

rm -rf /usr/share/plymouth/themes/charge

install -d /usr/share/plymouth/themes/spinner_alt
cp -r "${SRCROOT}/theming/plymouth/spinner_alt/"* /usr/share/plymouth/themes/spinner_alt/

plymouth-set-default-theme -R spinner_alt
