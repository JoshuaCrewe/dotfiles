function c
    set -l DIR (ls $HOME/code | fzf --height 40% --reverse) \
    && cd "$HOME/code/$DIR"
end
