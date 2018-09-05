#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

_install yarn

if ! which yarn > /dev/null; then
    while read in; do yarn global add "$in"; done < node-packages.txt
fi
