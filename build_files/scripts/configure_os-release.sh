#!/usr/bin/env bash
set -euxo pipefail

cat > /etc/os-release <<'EOF'
NAME="Leviathan"
VERSION="1.0"
ID=leviathan
ID_LIKE="fedora"
VERSION_ID=42
VERSION_CODENAME="Good Boy"
PRETTY_NAME="Leviathan 1.0 (FROM Fedora Silverblue)"
ANSI_COLOR="0;38;2;138;43;226"
CPE_NAME="cpe:/o:leviathan:leviathan:1.0"
PLATFORM_ID="platform:f42"
HOME_URL="https://github.com/large-farva/leviathan"
DOCUMENTATION_URL="https://github.com/large-farva/leviathan"
SUPPORT_URL="https://github.com/large-farva/leviathan"
BUG_REPORT_URL="https://github.com/large-farva/leviathan/issues"
SUPPORT_END=2027-01-01
VARIANT="Silverblue"
VARIANT_ID=leviathan-gnome-nvidia
OSTREE_VERSION='42.20250621.0'
BUILD_ID="Latest (F42.20250621)"
BOOTLOADER_NAME="Leviathan (F42.20250621)"
IMAGE_ID="leviathan-gnome-nvidia-42.20250621"
EOF

cat > /etc/machine-info <<'EOF'
PRETTY_HOSTNAME=Leviathan
ICON_NAME=
EOF
