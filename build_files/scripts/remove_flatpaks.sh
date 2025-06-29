#!/usr/bin/env bash
set -euxo pipefail

flatpak uninstall -y --system \
    io.github.radiolamp.mangojuice || true

# The following aren't flatpaks, but are installed by default.
# Working on getting them removed from the install.

# com.supermodel3.Supermodel \
# org.DolphinEmu.dolphin-emu \
# org.ppsspp.PPSSPP \
# github.shiiion.primehack \
# org.libretro.RetroArch \
# net.kuribo64.melonDS \
# org.duckstation.DuckStation \
# org.scummvm.ScummVM \
# app.xemu.xemu 