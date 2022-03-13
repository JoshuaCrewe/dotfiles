function q
    set -l DIR (ls $HOME/docs/quotes | fzf --height 40% --reverse) \
    && cd "$HOME/docs/quotes/$DIR"
end
