#!/bin/bash

source ../utils.sh

if test-arch; then
    # ZSH 
    arch-install zsh
    
    # Oh-My-Zsh and plugin dependencies
    aur-install oh-my-zsh autojump fzf

    # Custom plugins
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
elif test-debian; then
    echo "Not Implemented"
    exit 1
else
    echo "Not Implemented"
    exit 1
fi

# Configs
ln -s $PWD/.p10k.zsh $HOME/
ln -s $PWD/.zshrc $HOME/

# Set default shell
chsh -s $(which zsh)
