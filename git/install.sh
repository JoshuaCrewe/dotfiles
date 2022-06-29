#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/gitconfig.symlink"
dst="$HOME/.config/git/config"
_link "$src" "$dst"

src="$dirname/gitconfig.local.symlink"
dst="$HOME/.config/git/config.local"
_link "$src" "$dst"

src="$dirname/gitignore.symlink"
dst="$HOME/.config/git/gitignore"
_link "$src" "$dst"
