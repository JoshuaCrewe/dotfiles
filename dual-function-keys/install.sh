#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"


if [[ $is_linux == 1 ]]; then
    src="$dirname/dual-function-keys.yaml.symlink"
    dst="$HOME/.config/dual-function-keys/dual-function-keys.yaml"
    _link "$src" "$dst"

    src="$dirname/udevmon.yaml.symlink"
    dst="/etc/interception/udevmon.yaml"
    _sudo_link "$src" "$dst"

    _aur interception-dual-function-keys
fi
