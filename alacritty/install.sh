#!/bin/bash

source ../utils.sh

if test-arch; then
    arch-install alacritty
elif test-debian; then
    echo "Not Implemented"
    exit 1
else
    echo "Not Implemented"
    exit 1
fi

ln -s $PWD/.alacritty.yml $HOME/
