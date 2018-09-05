#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"


if [[ $is_mac == 1 ]]; then
    sh -c "$(dirname "$0")/install-macos.sh"
fi
