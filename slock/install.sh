#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"


if [[ $is_linux == 1 ]]; then
    src="$dirname/slock.service"
    dst="/etc/systemd/system/slock.service"
    chmod 644 "$src"
    _sudo_link "$src" "$dst"
    _sudo_enable 'slock.service'

    _install slock
fi
