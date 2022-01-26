#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

if [[ $is_mac == 1 ]]; then
    src="$dirname/alacritty.mac.symlink"
    dst="$HOME/.config/alacritty"
    _link "$src" "$dst"

    if hash brew 2>/dev/null; then
        if [[ ! -d /Applications/Alacritty.app ]]; then
            brew cask install alacritty
        fi
    fi
fi


if [[ $is_linux == 1 ]]; then
    src="$dirname/alacritty.linux.symlink"
    dst="$HOME/.config/alacritty"
    _link "$src" "$dst"

    _install alacritty
fi
