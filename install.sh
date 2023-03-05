#!/usr/bin/env bash

check_program() {
    if ! command -v "$1" &> /dev/null; then
        echo "Program $1 not found. Please install it and try again."
        exit 1
    fi
}


check_program stow

link() {
    stow --target="$HOME" --ignore="README.md" "$1"
}

# Install packages

link alacritty
link zsh
link powerlevel10k
