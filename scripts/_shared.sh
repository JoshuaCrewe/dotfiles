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
	if [ -f "$2" ] || [ -d "$2" ]; then
        if mv "$2" "$2.bak" 2>debug.log ; then
            _backup "moved $2 to $2.bak"
        else
            _warn "Backup $2 already exists"
        fi
	fi
	ln -sf "$1" "$2"
	_success "linked $1 to $2"
}

_sudo_link () {
	if [ -f "$2" ] || [ -d "$2" ]; then
        if sudo  mv "$2" "$2.bak" 2>/dev/null ; then
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
