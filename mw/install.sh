#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/user.symlink"
dst="$HOME/.config/mutt/user"
_link "$src" "$dst"

src="$dirname/templates.symlink"
dst="$HOME/.local/share/pandoc/templates"
_link "$src" "$dst"

_install neomutt
_install isync 
_install msmtp 
_install pass 
_install lynx 
_install notmuch 
_install urlview 
_install cronie
_aur mw
