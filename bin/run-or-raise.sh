#!/usr/bin/env bash
if [ $# -eq 2 ]; then
    window=$2
else
    window=$1
fi

if `wmctrl -xa $window`; then
    wmctrl -xa $window
    echo 'can get the window' >> ${HOME}/dotfiles/debug.log
else
    echo 'launched app' >> ${HOME}/dotfiles/debug.log
    exec $1
fi
