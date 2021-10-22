#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/rofi.symlink"
dst="$HOME/.config/rofi"
_link "$src" "$dst"

_install rofi
_install rofi-calc

# Set zsh as default shell
# chsh -s $(which fish)
