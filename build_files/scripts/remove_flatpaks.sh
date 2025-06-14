#!/usr/bin/env bash
set -euxo pipefail

flatpak uninstall -y --system \
    io.github.radiolamp.mangojuice \
    com.supermodel3.Supermodel \
    org.DolphinEmu.dolphin-emu \
    org.ppsspp.PPSSPP \
    github.shiiion.primehack \
    org.libretro.RetroArch \
    net.kuribo64.melonDS \
    org.duckstation.DuckStation \
    org.scummvm.ScummVM \
    app.xemu.xemu || true
