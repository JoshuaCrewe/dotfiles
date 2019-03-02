#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"


if [[ $is_linux == 1 ]]; then
    src="$dirname/sparkleshare.service"
    dst="/etc/systemd/system/sparkleshare.service"
    chmod 644 "$src"
    _sudo_link "$src" "$dst"
    _sudo_enable 'sparkleshare.service'
fi
