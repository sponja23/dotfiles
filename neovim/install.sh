#!/usr/bin/env bash

source ../utils.sh

check_program stow

# Neovim
if [ -x "$(command -v nvim)" ]; then
    echo "neovim is already installed, skipping..."
else
    echo "Installing neovim..."

    if test-arch; then
        arch-install neovim
    else
        echo "Unsupported OS. Please install neovim manually."
        exit 1
    fi
fi

# Packer
if [ -d "$HOME/.local/share/nvim/site/pack/packer" ]; then
    echo "packer.nvim is already installed, skipping..."
else
    echo "Installing packer.nvim..."

    if test-arch; then
        aur-install nvim-packer-git
    else
        echo "Unsupported OS. Please install packer.nvim manually."
        echo "See: https://github.com/wbthomason/packer.nvim#quickstart"
        exit 1
    fi
fi

# Mason dependencies
# TODO: Install these automatically
check_program git
check_program curl
check_program unzip
check_program tar
check_program gzip

link-files .
