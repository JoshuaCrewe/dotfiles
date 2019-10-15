#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

if [[ $is_linux == 1 ]]; then
    src="$dirname/i3blocks.symlink"
    dst="$HOME/.config/i3blocks"
    _link "$src" "$dst"

    _install i3blocks
fi
