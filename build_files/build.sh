#!/bin/bash

set -ouex pipefail

### Install packages

dnf5 -y install \
        bash-completion \
        dnf5-plugins \
        pipewire \
        sddm \
        sddm-breeze \
        plasma-desktop \
        plasma-nm \
        plasma-pa \
        dolphin \
        ark \
        spectacle \
        kitty \
        flatpak \
        distrobox \
        --setopt=install_weak_deps=False

#### Systemd
systemctl enable sddm.service
systemctl set-default graphical.target
systemctl enable podman.socket
