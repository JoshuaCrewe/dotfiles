# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

source ~/.zplug/init.zsh

zplug "zplug/zplug"                                # Have zplug manage its self
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # Use colour to show acutal commands
zplug "urbainvaes/fzf-marks"                       # Bookmarking with fzf filtering

zplug "b4b4r07/zsh-gomi"                           # Move things to system trash
zplug "zsh-users/zsh-completions"

# zplug "MichaelAquilina/zsh-you-should-use"

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "pimterry/notes", \
    as:command, \
    use:notes

zplug "paulirish/git-open"
#
zplug "witt3rd/894c9e0b9ca4e24e5574", \
    from:gist, \
    as:command, \
    use:brew-sync.sh                               # Keep homebrew in sync with dropbox

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load # --verbose
