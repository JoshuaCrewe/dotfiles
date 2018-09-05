#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

if [[ $is_mac == 1 ]]; then
    if hash brew 2>/dev/null; then
        if [[ ! -d /Applications/iTerm.app ]]; then
            brew cask install iterm2
        fi
    fi
fi
