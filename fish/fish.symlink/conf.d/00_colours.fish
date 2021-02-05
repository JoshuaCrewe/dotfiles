set -U foreground d0d0d0
set -U background 3a3a3a

set -U black0 4e4e4e
set -U black1 626262

set -U red0 d68787
set -U red1 d75f87

set -U green0 5f865f
set -U green1 87af87

set -U yellow0 d8af5f
set -U yellow1 ffd787

set -U blue0 85add4
set -U blue1 add4fb

set -U magenta0 d7afaf
set -U magenta1 ffafaf

set -U cyan0 87afaf
set -U cyan1 87d7d7

set -U white0 $foreground
set -U white1 e4e4e4

# https://fishshell.com/docs/current/index.html#variables-color

set -U fish_color_normal $white0 
set -U fish_color_command $green0 # cat
set -U fish_color_quote $yellow0 # 'this is a quote'
set -U fish_color_operator $blue0 # && $HOME
set -U fish_color_comment $black1
set -U fish_color_error $red0
