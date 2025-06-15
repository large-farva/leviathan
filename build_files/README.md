# Custom Image Build Scripts

This directory contains all modular scripts used to customize the Leviathan image. Each script handles a specific part of the build process and is called by `build.sh` in a structured, ordered fashion.

## Execution Order

The main orchestrator is `build.sh`, which runs:

1. `remove_packages.sh` – Remove RPM packages not needed in the final image
2. `remove_flatpaks.sh` – Clean up unnecessary preinstalled Flatpaks
3. `install_packages.sh` – Install RPM packages like fonts, tools, CLI utilities
4. `install_flatpaks.sh` – Add useful apps from Flathub
5. `remove_extensions.sh` – Remove unwanted GNOME Shell extensions
6. `install_extensions.sh` – Install core GNOME Shell extensions
7. `configure_dconf.sh` – Apply GNOME settings (e.g., extensions, layout, preferences)

## Script Overview

| Script | Purpose |
|--------|---------|
| `build.sh` | Main entrypoint — executes all other scripts in sequence |
| `remove_packages.sh` | Removes RPMs like `waydroid`, `noto-fonts`, etc. |
| `remove_flatpaks.sh` | Removes Flatpaks like RetroArch, PPSSPP, Dolphin, etc. |
| `install_packages.sh` | Installs system packages (e.g., fonts, CLI tools, cosign) |
| `install_flatpaks.sh` | Installs productivity and utility apps via Flatpak |
| `remove_extensions.sh` | Removes bloat GNOME extensions (burn-my-windows, cube, etc.) |
| `install_extensions.sh` | Adds preferred GNOME Shell extensions (dash-to-dock, vitals) |
| `configure_dconf.sh` | Applies GNOME desktop layout, favorites, and behavior settings |

## Editing Tips

- Add new packages to `install_packages.sh` or Flatpaks to `install_flatpaks.sh`
- Use `|| true` after removal lines to avoid failures if packages don’t exist
- Dconf changes must be one-liners for arrays (e.g., `favorite-apps=[]`)
- Always run `dconf update` after modifying `*.local.d` config files

---