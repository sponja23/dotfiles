#!/bin/bash

source ../utils.sh

if test-arch; then
    # ZSH 
    arch-install zsh
    
    # Oh-My-Zsh and plugin dependencies
    aur-install oh-my-zsh autojump fzf gitflow-avh

    # Custom plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/petervanderdoes/git-flow-completion ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/git-flow-completion
elif test-debian; then
    # ZSH
    debian-install zsh

    # Oh-My-Zsh
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    
    # Plugin dependencies
    debian-install autojump fzf

    # Custom plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    echo "MesloLGS Nerd Font must be installed manually on debian"
else
    echo "Not Implemented"
    exit 1
fi


# Configs
ln -fs $PWD/.p10k.zsh $HOME/
ln -fs $PWD/.zshrc $HOME/

# Set default shell
chsh -s $(which zsh)
