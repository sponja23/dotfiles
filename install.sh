#!/usr/bin/env bash

# Install packages

packages=(
    alacritty
    neovim
    powerlevel10k
    zsh
)

for package in "${packages[@]}"; do
    . "$PWD/$package/install.sh"

    link-files "$package"
done
