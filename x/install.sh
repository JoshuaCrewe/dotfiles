#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"


if [[ $is_linux == 1 ]]; then
    # src="$dirname/Xmodmap.symlink"
    # dst="$HOME/.Xmodmap"
    # _link "$src" "$dst"

    src="$dirname/Xresources.symlink"
    dst="$HOME/.Xresources"
    _link "$src" "$dst"

    # src="$dirname/xbindkeysrc.symlink"
    # dst="$HOME/.xbindkeysrc"
    # _link "$src" "$dst"

    src="$dirname/xinitrc.symlink"
    dst="$HOME/.xinitrc"
    _link "$src" "$dst"
fi
