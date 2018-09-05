#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/tmux.conf.symlink"
dst="$HOME/.tmux.conf"
_link "$src" "$dst"
