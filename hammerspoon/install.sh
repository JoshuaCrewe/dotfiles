#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

if [[ $is_mac == 1 ]]; then
    src="$dirname/hammerspoon.symlink"
    dst="$HOME/.hammerspoon"
    _link "$src" "$dst"
    if hash curl 2>/dev/null; then
        curl -LO https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip && \n
        unzip SpoonInstall.spoon.zip && \n
        mkdir -p $HOME/dotfiles/hammerspoon.symlink/Spoons && \n
        mv SpoonInstall.spoon $HOME/dotfiles/hammerspoon.symlink/Spoons
    fi

    if hash brew 2>/dev/null; then
        if [[ ! -d /Applications/Hammerspoon.app ]]; then
            brew cask install hammerspoon
        fi
    fi
fi
