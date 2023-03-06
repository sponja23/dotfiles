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
        check_program cargo
        
        cargo install alacritty

        (
            # Meslo Nerd Font install
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
        echo "Unsupported OS. Please install alacritty manually."
        exit 1
    fi
fi

link-files .
