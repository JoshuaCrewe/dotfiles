#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"


if [[ $is_linux == 1 ]]; then
    src="$dirname/i3lock.service"
    dst="/etc/systemd/system/i3lock.service"
    chmod 644 "$src"
    _sudo_link "$src" "$dst"
    _sudo_enable 'i3lock.service'

    _install i3lock
fi
