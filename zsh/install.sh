#!/usr/bin/env bash

source ../utils.sh

check_program stow

if [ -x "$(command -v zsh)" ]; then
    echo "zsh is already installed, skipping..."
else
    echo "Installing zsh..."

    if test-arch; then
        arch-install zsh
    elif test-debian; then
        debian-install zsh
    else
        echo "Not Implemented"
        exit 1
    fi
fi

if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh}" ]; then
    echo "oh-my-zsh is already installed, skipping..."
else
    check_program curl

    echo "Installing oh-my-zsh..."

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

link-files .
