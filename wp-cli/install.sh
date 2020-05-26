#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/scripts.symlink"
dst="$HOME/.wp-cli/scripts"
_link "$src" "$dst"

src="$dirname/config.yml.symlink"
dst="$HOME/.wp-cli/config.yml"
_link "$src" "$dst"
