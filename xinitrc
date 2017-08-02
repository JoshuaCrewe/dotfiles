#! /bin/bash
/usr/bin/xmodmap ~/.Xmodmap &
sleep .1
/usr/bin/feh --bg-scale ~/.wallpaper.jpg &
/usr/bin/dropbox &
/usr/bin/xrdb ~/.Xresources &
/usr/bin/xcape -t 350 -e 'Control_L=Escape;Shift_L=Shift_L|9;Shift_R=Shift_L|0;Hyper_L=Tab' &
exec startfluxbox
