[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/leviathan)](https://artifacthub.io/packages/search?repo=leviathan) [![Leviathan Image Build Status](https://github.com/large-farva/leviathan/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/large-farva/leviathan/actions/workflows/build.yml) [![ISO Build Status](https://github.com/large-farva/leviathan/actions/workflows/build_iso.yml/badge.svg?branch=main)](https://github.com/large-farva/leviathan/actions/workflows/build_iso.yml)

# Leviathan
A custom Fedora Atomic image for my wife and I. Built for gaming and daily use.

## Base System
- Built on Fedora 42
- Uses [Bazzite](https://bazzite.gg/) as the base image
- GNOME 48
- Optimized for Nvidia.

## Install
```bash
sudo bootc switch --enforce-container-sigpolicy ghcr.io/large-farva/leviathan:latest
```

If you want to install the image on a new system download and install Bazzite ISO first:
<https://download.bazzite.gg/bazzite-stable-amd64.iso>

## Package Management

GUI apps can be found as Flatpaks in the Gnome Software app or [FlatHub](https://flathub.org/) and installed with `flatpak install ...`.

CLI apps are available from [Homebrew](https://formulae.brew.sh/) using `brew install ...`.

## Acknowledgments

This project is based on the [Universal Blue image template](https://github.com/ublue-os/image-template) and builds upon the excellent work of the Universal Blue community.

This README format was stolen from [AmyOS](https://github.com/astrovm/amyos/tree/main)
