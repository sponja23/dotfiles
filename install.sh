#!/usr/bin/env bash

# Install packages

packages=(
    alacritty
    powerlevel10k
    zsh
)

for package in "${packages[@]}"; do
    . "$PWD/$package/install.sh"
done
