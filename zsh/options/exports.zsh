# set what gets put in PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:${HOME}/dotfiles/bin:$PATH"

# Use The Silver Searcher for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

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

export NOTES_DIRECTORY=~/Dropbox/notes/
