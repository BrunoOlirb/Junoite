#!/bin/bash

set -ouex pipefail

# For chrome and other packages that may install to /opt
ln -s /var/opt /opt

PKGS=(
    # Hardware support
    @hardware-support

    # Swap on ZRAM
    zram-generator-defaults

    # Audio support
    pipewire
    wireplumber

    # Multimedia, hardware acceleration and codecs
    ffmpeg
    libva-intel-driver
    @multimedia

    # Needed for homebrew, git and some more
    @development-tools 
    
    # CLI tools
    distrobox
    ddcutil

    # Graphical Interface
    sddm
    plasma-desktop
    plasma-nm
    plasma-pa
    @fonts
    
    # Theming for consistency
    sddm-breeze
    breeze-gtk
    darkly
    kvantum

    # Graphical tools
    dolphin
    spectacle
    ghostty
    code
    emacs
    chromium
    google-chrome-stable

    # Flatpaks
    flatpak
    plasma-discover
)

dnf5 -y in --setopt="install_weak_deps=False" "${PKGS[@]}"

### From ublue main:
# mitigate upstream packaging bug: https://bugzilla.redhat.com/show_bug.cgi?id=2332429
# swap the incorrectly installed OpenCL-ICD-Loader for ocl-icd, the expected package

dnf5 -y swap --repo='fedora' OpenCL-ICD-Loader ocl-icd