#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/urlview.symlink"
dst="$HOME/.urlview"
_link "$src" "$dst"

_install urlview
