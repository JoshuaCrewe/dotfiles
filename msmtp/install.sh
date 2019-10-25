#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/msmtprc.symlink"
dst="$HOME/.msmtprc"
# _link "$src" "$dst"

# _install msmtp
