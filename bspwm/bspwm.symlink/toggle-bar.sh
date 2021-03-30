#! /bin/bash

_current=$((`bspc config top_padding`))

if [[ $_current -gt 0 ]]; then
    polybar-msg cmd hide; bspc config top_padding 0
else
    polybar-msg cmd show; bspc config top_padding 30
fi
