#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

is_linux=0
is_mac=0

if [[ $(uname) = 'Linux' ]]; then
    is_linux=1
fi

if [[ $(uname) = 'Darwin' ]]; then
    is_mac=1
fi

_info() {
	# shellcheck disable=SC2059
	printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

_user() {
	# shellcheck disable=SC2059
	printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

_warn() {
	# shellcheck disable=SC2059
	printf "\r  [ \033[0;33mWARN\033[0m ] $1\n"
}

_success() {
	# shellcheck disable=SC2059
	printf "\r\033[2K  [ \033[00;32mDONE\033[0m ] $1\n"
}

_backup() {
	# shellcheck disable=SC2059
	printf "\r\033[2K  [ \033[00;34mBACKUP\033[0m ] $1\n"
}

_enable() {
	# shellcheck disable=SC2059
	printf "\r\033[2K  [ \033[00;32mENABLED\033[0m ] $1\n"
}

_fail() {
	# shellcheck disable=SC2059
	printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
	echo ''
	exit
}

_link () {
    if [ ! -d "$(dirname "$2")" ]; then
        mkdir -p "$(dirname "$2")"
    fi

	if [ -f "$2" ] || [ -d "$2" ]; then

        if [ -f "$2.bak" ] || [ -d "$2.bak" ]; then
            rm -rf "$2.bak"
        fi

        mv "$2" "$2.bak"
        _backup "moved $2 to $2.bak"

	fi
	ln -sf "$1" "$2"
	_success "linked $1 to $2"
}

_sudo_link () {
	if [ -f "$2" ] || [ -d "$2" ]; then
        if sudo  mv "$2" "$2.bak" 2>$HOME/dotfiles/debug.log ; then
            _backup "moved $2 to $2.bak"
        else
            _warn "Backup $2 already exists"
        fi
	fi
	sudo ln -sf "$1" "$2"
	_success "linked $1 to $2"
}

_sudo_enable () {
    sudo systemctl enable "$1" > /dev/null
    sudo systemctl start "$1" > /dev/null
    _enable "$1"
}

_install () {
    if ! hash $1 2>/dev/null; then
        if hash brew 2>/dev/null; then
            brew install "$1"
        elif hash pacman 2>/dev/null; then
            sudo pacman -S "$1"
        fi
    else
        _info "$1 is already installed"
    fi
}
