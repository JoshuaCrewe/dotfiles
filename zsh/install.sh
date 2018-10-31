#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/zshrc.symlink"
dst="$HOME/.zshrc"
_link "$src" "$dst"

_install zsh

# Set zsh as default shell
# chsh -s $(which zsh)

# Kick it into action ?
# This should take care of plugins too :)
# source $(HOME)/.zshrc
