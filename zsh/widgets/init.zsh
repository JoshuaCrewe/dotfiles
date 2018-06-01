function open-tig-status {
    BUFFER="tig status"
    zle accept-line
    zle reset-prompt
}
zle -N open-tig-status

function fzf-branches() {
    git branch -a --color=always | grep -v '/HEAD\s' | sort |
        fzf --height 50% --ansi --multi
        sed 's/^..//' | cut -d' ' -f1 |
        sed 's#^remotes/##'
    zle accept-line
}
zle -N fzf-branches
