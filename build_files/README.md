# Custom Image Build Scripts

This directory contains all modular scripts used to customize the Leviathan image. Each script handles a specific part of the build process and is called by `build.sh` in a structured, ordered fashion.

## Execution Order

The main orchestrator is `build.sh`, which runs:

1. `remove_packages.sh` – Remove RPM packages not needed in the final image  
2. `remove_flatpaks.sh` – Clean up unnecessary preinstalled Flatpaks  
3. `remove_extensions.sh` – Remove unwanted GNOME Shell extensions  
4. `install_packages.sh` – Install RPM packages like fonts, tools, CLI utilities  
5. `install_flatpaks.sh` – Add useful apps from Flathub  
6. `install_extensions.sh` – Install core GNOME Shell extensions  
7. `theming.sh` – Install wallpapers, icon themes, and GTK/Shell themes  
8. `configure_dconf.sh` – Apply GNOME settings (e.g., themes, layout, favorites, preferences)

## Script Overview

| Script                   | Purpose                                                          |
|--------------------------|------------------------------------------------------------------|
| `build.sh`               | Main entrypoint — executes all other scripts in sequence         |
| `remove_packages.sh`     | Removes unwanted RPMs                                            |
| `remove_flatpaks.sh`     | Removes unwanted Flatpaks                                        |
| `remove_extensions.sh`   | Removes undesired GNOME Shell extensions                         |
| `install_packages.sh`    | Installs system RPM packages (fonts, CLI tools, etc.)            |
| `install_flatpaks.sh`    | Installs Flatpak applications                                    |
| `install_extensions.sh`  | Installs preferred GNOME Shell extensions                        |
| `theming.sh`             | Installs wallpapers, icon themes, and GTK/Shell themes           |
| `configure_dconf.sh`     | Applies GNOME desktop layout, favorites, and behavior settings   |

## Editing Tips

- Add new packages to `install_packages.sh` or Flatpaks to `install_flatpaks.sh`  
- Use `|| true` after removal lines to avoid failures if items don’t exist  
- Place your theming assets in the `theming/` directory at the repo root under `wallpapers/`, `icons/`, and `themes/`  
- Dconf profile settings need proper quoting for arrays and strings (e.g., `favorite-apps=['…']`)  
- Always run `dconf update` after modifying files in `/etc/dconf/db/local.d/`  
