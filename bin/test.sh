#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

IS_LINUX=0
IS_MAC=0

if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
fi

ignore="Brewfile.work README.md .git bin config vimfx vimium.txt";

if [[ $IS_MAC == 1 ]]; then
    ignore="${ignore} fluxbox Xresources Xmodmap xbindkeysrc xinitrc"
fi

if [[ $IS_LINUX == 1 ]]; then
    ignore="${ignore} hammerspoon"
fi


echo "==========" >> towrite.txt 

for filename in *; do
    if [[ ! $ignore =~ $filename ]]; then
        echo ".$filename" >> towrite.txt 
    fi
done

if [ ! -d "${HOME}/dotfiles/test" ]; then
    mkdir "${HOME}/dotfiles/test"
fi

