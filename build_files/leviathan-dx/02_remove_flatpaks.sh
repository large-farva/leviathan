#!/usr/bin/env bash
set -euxo pipefail

flatpak uninstall -y --system \
    app/com.github.PintaProject.Pinta \
    app/org.mozilla.firefox \
    app/org.mozilla.Thunderbird \
    app/page.tesk.Refine || true