#!/bin/bash

source ../utils.sh

if test-arch; then
    # ZSH
    arch-install zsh tmux

    # oh-my-zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Oh-My-Zsh and plugin dependencies
    aur-install autojump fzf gitflow-avh

    # Custom plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k

    # Custom scripts
    for script in ./scripts/*; do
        ln -s "$PWD/scripts/$(basename "$script")" "$HOME"/.local/bin/
    done
elif test-debian; then
    # ZSH
    debian-install zsh

    # Oh-My-Zsh
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

    # Plugin dependencies
    debian-install autojump fzf git-flow

    # Custom plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k

    echo "MesloLGS Nerd Font must be installed manually on debian"
else
    echo "Not Implemented"
    exit 1
fi

# Configs
ln -fs "$PWD"/.p10k.zsh "$HOME"/
ln -fs "$PWD"/.zshrc "$HOME"/

# Set default shell
chsh -s "$(which zsh)"
