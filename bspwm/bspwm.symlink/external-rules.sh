#!/bin/env bash
  
wid="$1"
#class="$2"
#instance="$3"
#eval "$4"
title=$(xprop -id $wid | grep "^WM_NAME" | awk -F " = " '{print $2}')

if [[ "$title" = '"launcher"' ]]; then
    echo 'state=floating'
    echo 'center=on'
    echo 'rectangle=800x200+0+0'
    echo 'desktop=5'
    echo 'sticky=on'
fi
