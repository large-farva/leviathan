#!/usr/bin/env bash
set -euxo pipefail

flatpak uninstall -y --system \
    com.github.PintaProject.Pinta \
    com.ranfdev.DistroShelf \
    org.mozilla.Thunderbird \
    page.tesk.Refine \
    io.github.kolunmi.Bazaar || true