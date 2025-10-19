[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/leviathan)](https://artifacthub.io/packages/search?repo=leviathan) [![Leviathan Image Build Status](https://github.com/large-farva/leviathan/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/large-farva/leviathan/actions/workflows/build.yml) [![Build Leviathan Disk Images](https://github.com/large-farva/leviathan/actions/workflows/build_disk.yml/badge.svg?branch=main)](https://github.com/large-farva/leviathan/actions/workflows/build_disk.yml)

<div align="center">
  <picture>
    <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/large-farva/leviathan/refs/heads/main/repo_files/watermark.png">
    <img alt="Leviathan Logo" src="https://raw.githubusercontent.com/large-farva/leviathan/refs/heads/main/repo_files/watermark.png" width="200">
  </picture>
</div>

# Leviathan
**Leviathan** is a custom [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) image built for my wife — optimized for **gaming**, **daily use**, and tailored **GNOME enhancements**.

This image is definitely not for everyone.

## Base System
- Built on Fedora 42
- Image built on **[bluefin-hwe-nvidia](https://github.com/orgs/ublue-os/packages?repo_name=bluefin)
- GNOME 48
- Built using [uBlue's image-template](https://github.com/ublue-os/image-template)

## Features
- Custom GNOME layout
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

> [!WARNING]
> The ISO sucks!
>
> It would get stuck on a grey screen upon installation after the Anaconda installation selections. \
> I tried to fix it, but it's just failing now. \
> Just install Bluefin and rebase if you want to try it out.

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
| `install_packages.sh`     | Add steam                                       |
| `install_flatpaks.sh`     | Add a few Flatpaks my wife uses                 |
| `install_extensions.sh`   | Add preferred Gnome Shell extensions            |
| `theming.sh`              | Deploy backgrounds                              |
| `configure_os-release.sh` | Override `/etc/os-release` with custom branding |
| `configure_plymouth.sh`   | Appy custom boot splash screen                  |
| `configure_gdm.sh`        | Install GDM shell CSS & login background        |
| `configure_dconf.sh`      | Set dconf defaults                              |

All organized inside the ```build_files/``` directory.

## Package Management
- **Flatpak:** GUI apps via [Flathub](https://flathub.org/) and GNOME Software.
- **Homebrew:** CLI utilities with ```brew install ...```.

## ArtifactHub Listing
Find [Leviathan](https://artifacthub.io/packages/search?repo=leviathan) on ArtifactHub.

## Acknowledgments
Leviathan is made possible by:
- [Universal Blue Project](https://github.com/ublue-os)
- [Bluefin](https://projectbluefin.io/)


README inspired by [AmyOS](https://github.com/astrovm/amyos/tree/main).
