# set what gets put in PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:${HOME}/.local/bin:$PATH"

# Use Brew curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# Use Brew php
export PATH="/usr/local/opt/php@7.3/bin:$PATH"

# Load dotfile development Environment
export DOTFILES="$HOME/dotfiles"
export PATH="${HOME}/dotfiles/bin:$PATH"

# Use The Silver Searcher for fzf
if [[ -x `which fzf` ]]; then

    export FZF_DEFAULT_OPTS="--height 40% --color bg+:#121212"

    if [[ -x `which fd` ]]; then
        export FZF_DEFAULT_COMMAND='fd --hidden -i -E "node_modules"'

        export FZF_ALT_C_COMMAND='fd --hidden -i -E "node_modules" -E ".git" --type directory'
        export FZF_CTRL_T_COMMAND='fd --hidden -i -E "node_modules" -E ".git" --type file'
    else
        echo ' Install fd for quicker folder search'
    fi
fi

# Be able to npm install without sudo
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Set the colours for ls command
# Setup terminal, and turn on colors
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Enable color in grep
# export GREP_OPTIONS='--color=auto'
# export GREP_COLOR='3;33'

# Dont check internal mail.
# This will stop the "you've got mail" message when opening a terminal
unset MAILCHECK

# Set up Go env
export GOPATH=${HOME}/go
export PATH=$GOPATH/bin:$PATH

# Set up cargo/rust path
export PATH="${HOME}/.cargo/bin:$PATH"

# Always choose vim to edit with
export EDITOR=$(which nvim)

export GPG_TTY=$(tty) 

if hash nnn 2>/dev/null; then
    export NNN_USE_EDITOR=1
fi

# Stop homebrew trying to access Github
export HOMEBREW_NO_GITHUB_API=1

export PATH="$HOME/.composer/vendor/bin:$PATH"

export NOTES_DIRECTORY="$HOME/.docs/notes/"

export PATH="$HOME/dotfiles/tui:$PATH"

if [[ $IS_MAC == 1 ]]; then
    export BROWSER="open"
fi

export BROWSER="xdg-open"

export PURE_PROMPT_SYMBOL='$'
export PURE_PROMPT_VICMD_SYMBOL='λ'

export HISTFILE=$HOME/.histfile
export HISTSIZE=10000
export SAVEHIST=10000

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
