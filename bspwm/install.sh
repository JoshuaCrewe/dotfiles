#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"


if [[ $is_linux == 1 ]]; then
    src="$dirname/bspwm.symlink"
    dst="$HOME/.config/bspwm"
    _link "$src" "$dst"

    _install bspwm
fi
