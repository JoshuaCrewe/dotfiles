function q
    set -l DIR (ls $HOME/Downloads/quotes | fzf --height 40% --reverse) \
    && cd "$HOME/Downloads/quotes/$DIR"
end
