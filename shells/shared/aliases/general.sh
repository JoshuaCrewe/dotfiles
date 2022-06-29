alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias :wq="exit"
alias :q="exit"

# Force tmux to start in 256 colours,
# this is actually an insane problem
alias tmux="tmux -2"

alias j="jump"
alias m="mark"

alias mutt="cd ~/Downloads/ && neomutt"

# https://github.com/utatti/pen
if hash pen 2>/dev/null; then

    if hash pandoc 2>/dev/null; then
        alias md="pen --pandoc gfm"
    else
        alias md="pen gfm"
    fi

fi

alias sudo=" sudo"

alias sz="source ~/.zshrc"
