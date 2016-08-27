
# Red dots for completing process'
COMPLETION_WAITING_DOTS="true"

# Turn off flow control so <c-s> can save in vim
setopt noflowcontrol
stty -ixon
stty stop undef

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Added by MAMP
export PATH=$PATH:"/Applications/MAMP/Library/bin/"

# Be able to npm install without sudo
NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Set up a decent history
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredumps;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date* --help";

set editing-mode emacs

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
