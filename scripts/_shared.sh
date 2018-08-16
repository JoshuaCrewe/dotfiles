#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

_info() {
	# shellcheck disable=SC2059
	printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

_user() {
	# shellcheck disable=SC2059
	printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

_success() {
	# shellcheck disable=SC2059
	printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
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
	if [ -f "$2" ]; then
        mv "$2" "$2.bak"
        _success "moved $2 to $2.bak"
	fi
	ln -sf "$1" "$2"
	_success "linked $1 to $2"
}

_sudo_link () {
	if [ -f "$2" ]; then
        sudo mv "$2" "$2.bak"
        _success "moved $2 to $2.bak"
	fi
	sudo ln -sf "$1" "$2"
	_success "linked $1 to $2"
}

_sudo_enable () {
    sudo systemctl enable "$1" > /dev/null
    sudo systemctl start "$1" > /dev/null
    _enable "$1"
}
