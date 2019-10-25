#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

if [[ $is_mac == 1 ]]; then

	echo "› Brew Bundle..."
    if hash brew 2>/dev/null; then
        cd $dirname
        brew bundle
        cd -
    fi

#	echo "› set up mac defaults..."
    sh -c "macos"
fi
