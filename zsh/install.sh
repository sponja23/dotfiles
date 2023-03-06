#!/usr/bin/env bash

source "$(dirname -- "${BASH_SOURCE[0]}")/../utils.sh"

check_program stow

if ! [ -x "$(command -v zsh)" ] && prompt "zsh not found. Install it now?"; then
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

if ! [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh}" ] && prompt "oh-my-zsh not found. Install it now?"; then
    check_program curl

    echo "Installing oh-my-zsh..."

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
