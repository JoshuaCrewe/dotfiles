#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"


if [[ $is_linux == 1 ]]; then
    src="$dirname/xmonad.symlink"
    dst="$HOME/.xmonad"
    chmod 644 "$src"
    _link "$src" "$dst"

    _install xmonad
    _install xmobar
fi
