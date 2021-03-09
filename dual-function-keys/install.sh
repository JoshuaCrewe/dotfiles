#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"


if [[ $is_linux == 1 ]]; then
    _aur interception-dual-function-keys

    src="$dirname/dual-function-keys.yaml.symlink"
    dst="$HOME/.config/dual-function-keys/dual-function-keys.yaml"
    _link "$src" "$dst"

    src="$dirname/udevmon.yaml.symlink"
    dst="/etc/interception/udevmon.yaml"
    _sudo_link "$src" "$dst"

    src="$dirname/udevmon.service"
    dst="/etc/systemd/system/udevmon.service"
    chmod 644 "$src"
    _sudo_link "$src" "$dst"
    _sudo_enable 'udevmon.service'
fi

