#!/bin/bash

set -e
source ./utils.sh

if test-arch; then
    arch-install --needed git base-devel

    # Install yay if needed
    if [ -x "$(command -v yay)" ]; then
        git clone https://aur.archlinux.org/yay.git
        (cd yay && makepkg -si)
    fi


    # Install rust if needed
    if [ -x "$(command -v rustc)" ]; then
        arch-install rustup
        rustup default stable
    fi

    aur-install ttf-meslo-nerd-font-powerlevel10k
fi
