#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/mutt.symlink"
dst="$HOME/.mutt"
_link "$src" "$dst"

src="$dirname/muttrc.symlink"
dst="$HOME/.muttrc"
_link "$src" "$dst"

_install neomutt
