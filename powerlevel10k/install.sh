#!/usr/bin/env bash

source "$(dirname -- "${BASH_SOURCE[0]}")/../utils.sh"

check_program stow

if ! [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh}" ]; then
    echo "Please install oh-my-zsh first."
    exit 1
fi

link-files .
