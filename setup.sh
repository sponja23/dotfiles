#!/bin/bash

set -e
source ./utils.sh

if test-arch; then
    arch-install --needed git base-devel curl

    # Install paru if needed
    if [ -x "$(command -v paru)" ]; then
        git clone https://aur.archlinux.org/paru.git /tmp/paru
        (cd /tmp/paru && makepkg -si)
    fi

    # Install rust if needed
    if [ -x "$(command -v rustc)" ]; then
        arch-install rustup
        rustup default stable
    fi
elif test-debian; then
    debian-install git build-essential curl

    # Install rust if needed
    if [ -x "$(command -v rustc)" ]; then
        debian-install rustup
        rustup default stable
    fi
else
    echo "Not Implemented"
    exit 1
fi
