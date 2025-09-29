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

| Script                   | Purpose                                                                 |
|--------------------------|-------------------------------------------------------------------------|
| `build.sh`               | Main entrypoint — executes all other scripts in sequence                |
| `remove_packages.sh`     | Prune unwannted packages.                                               |
| `remove_flatpaks.sh`     | Remove preinstalled Flatpaks                                            |
| `remove_extensions.sh`   | Remove undesired GNOME Shell extensions                                 |
| `install_packages.sh`    | Install system RPM packages                                             |
| `install_flatpaks.sh`    | Install Flatpak applications                                            |
| `install_extensions.sh`  | Install preferred GNOME Shell extensions                                |
| `theming.sh`             | Install wallpapers and the **spinner_alt** plymouth theme               |
| `configure_dconf.sh`     | Apply dconf defaults for GNOME desktop                                  |

## Credits

The **spinner_alt** plymouth theme was created by [adi1090x](https://github.com/adi1090x/plymouth-themes).
