source ~/.zplug/init.zsh

# Supports oh-my-zsh plugins and the like
# zplug "plugins/lol",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/git-extras",   from:oh-my-zsh
zplug "plugins/colored-man-pages",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh
zplug "andrewferrier/fzf-z"
# zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "supercrabtree/k"
zplug "urbainvaes/fzf-marks"

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

zplug "witt3rd/894c9e0b9ca4e24e5574", \
    from:gist, \
    as:command, \
    use:brew-sync.sh

zplug "b4b4r07/zsh-gomi", if:"which fzf" # Install zsh-gomi(If fzf is already installed)

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
