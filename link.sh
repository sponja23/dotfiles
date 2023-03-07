#!/usr/bin/env bash

source ./utils.sh

# Link files
link-files --no-folding alacritty
link-files neovim # Fold nvim config
link-files --no-folding powerlevel10k
link-files --no-folding zsh
