[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/leviathan)](https://artifacthub.io/packages/search?repo=leviathan) [![Leviathan Image Build Status](https://github.com/large-farva/leviathan/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/large-farva/leviathan/actions/workflows/build.yml) [![Build Leviathan Disk Images](https://github.com/large-farva/leviathan/actions/workflows/build_disk.yml/badge.svg?branch=main)](https://github.com/large-farva/leviathan/actions/workflows/build_disk.yml)

# Leviathan
**Leviathan** is a custom [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) image built for personal use by my wife and I — optimized for **gaming**, **daily use**, and tailored **GNOME enhancements**.

This image is most likely not for many folks.

## Base System
- Built on Fedora 42
- Image built on **[Bazzite](https://bazzite.gg/)** (NVIDIA variant)
- GNOME 48
- Built using [uBlue's image-template](https://github.com/ublue-os/image-template)

## Features
- Custom GNOME layout
- Pruned Flatpak, RPM, and Gnome Extension bloat

## Installation Methods

### Bootc Install (On an existing system)
Install directly via `bootc`:

```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/large-farva/leviathan:latest
```

### ISO Installer

Update: The ISO sucks.

Burn or boot from the [Leviathan ISO](https://github.com/large-farva/leviathan/actions/workflows/build_iso.yml) (see artifacts in workflow runs):
- Fully graphical Anaconda installer
- Custom ```iso.toml``` with support for:
    - Disk and user setup
    - Localization and timezone

Powered by [bootc-image-builder](https://github.com/containers/bootc-image-builder) for portable and reproducible installs.

## Modularity & Customizations
This repo uses **modular build** scripts:

| File                    | Purpose                                    |
| ----------------------- | ------------------------------------------ |
| `install_packages.sh`   | Adds Fedora/RPMFusion/COPR packages        |
| `remove_packages.sh`    | Removes undesired packages (e.g. Waydroid) |
| `install_flatpaks.sh`   | Installs Flatpaks (e.g. VSCode, Discord)   |
| `remove_flatpaks.sh`    | Removes preinstalled Flatpaks              |
| `install_extensions.sh` | Adds GNOME Shell extensions                |
| `remove_extensions.sh`  | Removes bundled GNOME Shell extensions     |
| `configure_dconf.sh`    | Sets UI behavior, extensions, layout       |

All organized inside the ```build_files/``` directory.

## Package Management
- **Flatpak:** GUI apps via [Flathub](https://flathub.org/) and GNOME Software.
- **Homebrew:** CLI utilities with ```brew install ...```.

## ArtifactHub Listing
Find [Leviathan](https://artifacthub.io/packages/search?repo=leviathan) on ArtifactHub.

## Acknowledgments
Leviathan is made possible by:
- [Universal Blue Project](https://github.com/ublue-os)
- [Bazzite](https://bazzite.gg/)


README format inspired by [AmyOS](https://github.com/astrovm/amyos/tree/main).