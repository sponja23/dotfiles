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

AUR_HELPER=yay

aur-install() {
    $AUR_HELPER -S --noconfirm "$@"
}

debian-install() {
    sudo apt install -y "$@"
}

debian-add-repository() {
    sudo add-apt-repository -y "$@" 
}
