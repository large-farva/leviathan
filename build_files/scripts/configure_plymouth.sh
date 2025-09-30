#!/usr/bin/env bash
set -euxo pipefail

: "${SRCROOT:?must be set}"

rm -rf /usr/share/plymouth/themes/charge

install -d /usr/share/plymouth/themes/spinner_alt
cp -r "${SRCROOT}/theming/plymouth/spinner_alt/"* /usr/share/plymouth/themes/spinner_alt/

cat >/etc/plymouth/plymouthd.conf <<EOF
[Daemon]
Theme=spinner_alt
ShowDelay=0
DeviceTimeout=8
EOF