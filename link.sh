#!/usr/bin/env bash

source ./utils.sh

# Link files
link-files --no-folding alacritty
# link-files nvim # Fold nvim config
link-files --no-folding powerlevel10k
link-files --no-folding zsh
link-files vim # Fold vim config
link-files --no-folding i3
# link-files awesome # Fold awesome config
link-files polybar # Fold polybar config
link-files --no-folding picom
# link-files --no-folding x
# link-files xmonad # Fold xmonad config
