#!/bin/bash

### Platform testing
test-arch() {
    [ -f "/etc/arch-release" ]
}

test-debian() {
    [ -f "/etc/debian_version" ]
}

### Commenting/Uncommenting Lines
# Source: https://unix.stackexchange.com/a/516986
comment() {
    local regex="${1:?}"
    local file="${2:?}"
    local comment_mark="${3:-#}"
    sed -ri "s:^([ ]*)($regex):\\1$comment_mark\\2:" "$file"
}

uncomment() {
    local regex="${1:?}"
    local file="${2:?}"
    local comment_mark="${3:-#}"
    sed -ri "s:^([ ]*)[$comment_mark]+[ ]?([ ]*$regex):\\1\\2:" "$file"
}

### Package installers
arch-install() {
    sudo pacman -S --noconfirm "$@"
}

AUR_HELPER="${AUR_HELPER:-paru}"

aur-install() {
    $AUR_HELPER -S --noconfirm "$@"
}

debian-install() {
    sudo apt install -y "$@"
}

debian-add-repository() {
    sudo add-apt-repository -y "$@"
}

check_program() {
    if ! command -v "$1" &>/dev/null; then
        echo "Program $1 not found. Please install it and try again."
        exit 1
    fi
}

link-files() {
    stow --target="$HOME" --ignore="(README.md|install.sh)" --no-folding "$1"
}

prompt() {
    echo -n "$1 [y/N] "
    read -r
    [[ $REPLY =~ ^[Yy]$ ]]
}
