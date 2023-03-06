#!/usr/bin/env bash

source ../utils.sh

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
if ! [ -f "/usr/share/fonts/MesloLGS-NF-Regular.ttf" ] && prompt "MesloLGS Nerd Font not found. Install it now?"; then
    echo "Installing MesloLGS Nerd Font..."

    if test-arch; then
        check_program "$AUR_HELPER"

        aur-install ttf-meslo-nerd-font-powerlevel10k
    elif test-debian; then
        (
            # Clone repo into tmp
            cd /tmp || exit 1

            git clone https://github.com/romkatv/powerlevel10k-media

            # Copy font to local fonts
            sudo cp powerlevel10k-media/MesloLGS\ NF\ Regular.ttf /usr/share/fonts/MesloLGS-NF-Regular.ttf
            sudo cp powerlevel10k-media/MesloLGS\ NF\ Bold.ttf /usr/share/fonts/MesloLGS-NF-Bold.ttf
            sudo cp powerlevel10k-media/MesloLGS\ NF\ Italic.ttf /usr/share/fonts/MesloLGS-NF-Italic.ttf
            sudo cp powerlevel10k-media/MesloLGS\ NF\ Bold\ Italic.ttf /usr/share/fonts/MesloLGS-NF-BoldItalic.ttf

            # Update font cache
            sudo fc-cache -f -v

            rm -rf ./powerlevel10k-media
        )
    else
        echo "Unsupported OS. Please install MesloLGS Nerd Font manually."
        exit 1
    fi
fi

link-files .
