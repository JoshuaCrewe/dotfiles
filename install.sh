#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

# test for brew and install
if ! hash brew 2>/dev/null; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # Update brew
    brew update
fi;


# Test for  git and install
if ! hash git 2>/dev/null; then
    _install git
fi

# Test for dotfiles and install
if [ ! -d "${HOME}/dotfiles" ]; then
    if ! hash git 2>/dev/null; then
        git clone https://github.com/JoshuaCrewe/dotfiles.git ${HOME}/dotfiles
    fi
else
    if ! hash git 2>/dev/null; then
        cd ${HOME}/dotfiles && git pull
    fi
fi

cd ${HOME}/dotfiles

sh -c scripts/install.sh
