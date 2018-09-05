#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

if [[ $is_mac == 1 ]]; then
    src="$dirname/karabiner.symlink"
    dst="$HOME/.config/karabiner"
    _link "$src" "$dst"

    if hash brew 2>/dev/null; then
        brew cask install karabiner-elements
    fi
fi
