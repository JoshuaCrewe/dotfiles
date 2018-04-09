function open-tig-status {
    BUFFER="tig status"
    zle accept-line
    zle reset-prompt
}
zle -N open-tig-status

function fzf-checkout-branch() {
    local branches branch
    branches=$(git branch --all | grep -v $(git rev-parse --abbrev-ref HEAD)) &&
        branch=$(echo "$branches" |
    fzf --height 40% --reverse -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
        git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
    zle accept-line
}
zle -N fzf-checkout-branch
