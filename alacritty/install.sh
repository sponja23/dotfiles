#!/usr/bin/env bash

source ../utils.sh

check_program stow

if [ -x "$(command -v alacritty)" ]; then
    echo "alacritty already installed, skipping..."
else
    echo "Installing alacritty..."

    if test-arch; then
        arch-install alacritty ttf-meslo-nerd-font-powerlevel10k
    elif test-debian; then
        debian-install alacritty

        echo "MesloLGS Nerd Font must be installed manually on debian" 
    else
        echo "Unsupported OS. Please install alacritty manually."
        exit 1
    fi
fi

link-files .
