#!/bin/bash

set -e

./setup.sh
(cd alacritty/ && ./install.sh)
(cd zsh/ && ./install.sh)
