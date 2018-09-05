#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

# This does not work
dirname=$(cd "$(dirname "$0")"; pwd)
source "$dirname/../scripts/_shared.sh"

src="$dirname/vimrc.symlink"
dst="$HOME/.vimrc"
_link "$src" "$dst"

src="$dirname/vim.symlink"
dst="$HOME/.vim"
_link "$src" "$dst"

# if [[ $is_linux == 1 ]]; then
    # _install gvim
# fi

if [[ $is_mac == 1 ]]; then
    if hash brew 2>/dev/null; then
        if hash macvim 2>/dev/null; then
            brew install vim --with-override-system-vi
        fi
    fi
fi

 if [ ! -d ~/.vim/autoload/plug.vim ]; then
     curl -sfLo ~/.vim/autoload/plug.vim \
         --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
     vim +PluginInstall +qall
 else
     vim +PluginInstall +qall
 fi
