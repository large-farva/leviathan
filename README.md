[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/leviathan)](https://artifacthub.io/packages/search?repo=leviathan) [![Leviathan Image Build Status](https://github.com/large-farva/leviathan/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/large-farva/leviathan/actions/workflows/build.yml) [![Build Leviathan Disk Images](https://github.com/large-farva/leviathan/actions/workflows/build_disk.yml/badge.svg?branch=main)](https://github.com/large-farva/leviathan/actions/workflows/build_disk.yml)

<div align="center">
  <picture>
    <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/large-farva/leviathan/refs/heads/main/theming/plymouth/watermark.png">
    <img alt="Leviathan Logo" src="https://raw.githubusercontent.com/large-farva/leviathan/refs/heads/main/theming/plymouth/watermark.png" width="200">
  </picture>
</div>

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
- Custom Theming
- Pruned wallpapers, Flatpaks, RPM/DNF, and Gnome Extensions
- Modular build scripts for easy tweaks

## Installation Methods

### Bootc "Container" Install
On any rpm-ostree host (Fedora Silverblue, Bazzite, etc.)

Install directly via `bootc`:

```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/large-farva/leviathan:latest
```
This swaps your OS in-place to the Leviathan container image.

### ISO Installer

**Update:** The ISO sucks. \
It would get stuck on a grey screen upon installation, after the Anaconda installation selections. I tried to fix it, but it's just failing now. \
Just install Bazzite and rebase if you want to try it out.

Burn or boot from the [Leviathan ISO](https://github.com/large-farva/leviathan/actions/workflows/build_iso.yml) (see artifacts in workflow runs):
- Fully graphical Anaconda installer
- Custom ```iso.toml``` with support for:
    - Disk and user setup
    - Localization and timezone

## Modularity & Customizations
This repo uses **modular build** scripts:

| File                      | Purpose                                         |
| ------------------------- | ----------------------------------------------- |
| `remove_packages.sh`      | Prune unwanted packages                         |
| `remove_flatpaks.sh`      | Remove some default Flatpaks                    |
| `remove_extensions.sh`    | Strip bundled GNOME Shell extensions            |
| `install_packages.sh`     | Add some system packages                        |
| `install_flatpaks.sh`     | Add a few Flatpaks my wife and I use            |
| `install_extensions.sh`   | Add preferred Gnome Shell extensions            |
| `theming.sh`              | Deploy backgrounds, icons, GTK & Shell themes   |
| `configure_os-release.sh` | Override `/etc/os-release` with custom branding |
| `configure_plymouth.sh`   | Appy custom boot splash screen                  |
| `configure_gdm.sh`        | Install GDM shell CSS & login background        |
| `configure_dconf.sh`      | Set GNOME & GDM dconf defaults                  |

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


README inspired by [AmyOS](https://github.com/astrovm/amyos/tree/main).