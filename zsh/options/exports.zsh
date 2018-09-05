# set what gets put in PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:${HOME}/.local/bin:${HOME}/dotfiles/bin:$PATH"

export DOTFILES="$HOME/dotfiles"

# Use The Silver Searcher for fzf

if [[ -x `which fzf` ]]; then
    if [[ -x `which fd` ]]; then
        export FZF_DEFAULT_COMMAND='fd --hidden -i -E "node_modules"'
        export FZF_DEFAULT_OPTS="--height 40%"

        export FZF_ALT_C_COMMAND='fd --hidden -i -E "node_modules" -E ".git" --type directory'
        export FZF_CTRL_T_COMMAND='fd --hidden -i -E "node_modules" -E ".git" --type file'
    else
        echo ' Install fd for quicker folder search'
    fi
fi

# Be able to npm install without sudo
export NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"

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

# export NOTES_DIRECTORY=~/Dropbox/notes/

# Dont check internal mail.
# This will stop the "you've got mail" message when opening a terminal
unset MAILCHECK

# Set up Go env
export GOPATH=${HOME}/go
export PATH=$GOPATH/bin:$PATH

export EDITOR=$(which vim)
