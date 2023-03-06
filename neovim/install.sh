#!/usr/bin/env bash

source "$(dirname -- "${BASH_SOURCE[0]}")/../utils.sh"

check_program stow

# Neovim
if ! [ -x "$(command -v nvim)" ] && prompt "neovim not found. Install it now?"; then
    echo "Installing neovim..."

    if test-arch; then
        arch-install neovim
    elif test-debian; then
        debian-install neovim
    else
        echo "Unsupported OS. Please install neovim manually."
        echo "See: https://github.com/neovim/neovim/wiki/Installing-Neovim"
        exit 1
    fi
fi

# Packer
if ! [ -d "$HOME/.local/share/nvim/site/pack/packer" ] && prompt "packer.nvim not found. Install it now?"; then
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
