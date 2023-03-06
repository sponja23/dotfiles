#!/usr/bin/env bash

source "$(dirname -- "${BASH_SOURCE[0]}")/../utils.sh"

check_program stow

# Alacritty
if ! [ -x "$(command -v alacritty)" ] && prompt "alacritty not found. Install it now?"; then
    echo "Installing alacritty..."

    if test-arch; then
        arch-install alacritty
    elif test-debian; then
        check_program cargo

        cargo install alacritty
    else
        echo "Unsupported OS. Please install alacritty manually."
        exit 1
    fi
fi

# MesloLGS Nerd Font
if ! (fc-list | grep -q MesloLGS-NF) && prompt "MesloLGS Nerd Font not found. Install it now?"; then
    echo "Installing MesloLGS Nerd Font..."

    if test-arch; then
        check_program "$AUR_HELPER"

        aur-install ttf-meslo-nerd-font-powerlevel10k
    else
        echo "Unsupported OS. Please install MesloLGS Nerd Font manually."
        exit 1
    fi
fi

link-files .
