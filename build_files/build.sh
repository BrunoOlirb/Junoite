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
        google-noto-emoji-fonts \
        google-noto-color-emoji-fonts \
        google-noto-sans-cjk-fonts \
        google-noto-serif-cjk-fonts \
        --setopt=install_weak_deps=False

#### Systemd

systemctl enable sddm.service
systemctl set-default graphical.target

systemctl enable flatpak-update.service
systemctl enable flatpak-update.timer

systemctl enable podman.socket
