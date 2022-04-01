#!/bin/bash

source ../utils.sh

if test-arch; then
    arch-install alacritty
elif test-debian; then
    debian-add-repository ppa:aslatter/ppa
    debian-install alacritty
else
    echo "Not Implemented"
    exit 1
fi

ln -fs $PWD/.alacritty.yml $HOME/
