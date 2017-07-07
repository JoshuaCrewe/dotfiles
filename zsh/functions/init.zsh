source ~/dotfiles/zsh/functions/fzf.zsh
source ~/dotfiles/zsh/functions/general.zsh

function system-update() {

    printf "update homebrew ? [y/N]  "
    read response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        brew=true
    fi

    printf "update npm ? [y/N]  "
    read response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        npm=true
    fi

    printf "update zplug ? [y/N]  "
    read response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        zplug=true
    fi


    if [[ ($brew == true) ]]; then
        printf 'updating homebrew ...'
        brew update && brew upgrade && brew cleanup && brew prune && brew doctor
    fi

    if [[ ($brew == true) ]]; then
        printf 'updating npm ...'
        npm update -g
    fi

    if [[ ($brew == true) ]]; then
        printf 'updating zplug ...'
        zplug update
    fi
}
