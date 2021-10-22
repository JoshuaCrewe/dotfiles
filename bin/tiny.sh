#!/usr/bin/env bash

# https://gitlab.com/uoou/dotfiles/-/tree/master/stow/bin/home/drew/.local/bin/tiny

[ -z "$1" ] && exit

sed -i "3i## $(date +'%a %d %b %Y %H:%M %Z')\n$*\n" ~/gemini/root/tiny.gmi
