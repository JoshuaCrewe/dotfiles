#!/usr/bin/env bash

if `wmctrl -xa $1`; then
    wmctrl -xa $1
else
    exec $@
fi
