#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/offlineimaprc.symlink"
dst="$HOME/.offlineimaprc"
_link "$src" "$dst"

_install offlineimap
