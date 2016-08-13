# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="pure"
#autoload -U promptinit && promptinit
#prompt pure

# Red dots for completing process'
COMPLETION_WAITING_DOTS="true"

# c - browse chrome history
fox() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Firefox/Profiles/129gnhjg.Joshua/places.sqlite /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from moz_places order by last_visit_date desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# Use FZF to search though the command line history
fh() {
eval $(history | fzf +s | sed 's/ *[0-9]* *//')
}

# Plugins to use
plugins=(git brew brew-cask catimg git-extras github lol nyan osx sublime z tmux zsh-syntax-highlighting)

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/ocean.dark.sh"
[[ -s $BASE17_SHELL ]] && source $BASE16_SHELL

# Turn off flow control
setopt noflowcontrol
stty -ixon
stty stop undef

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:"/Applications/MAMP/Library/bin/"

source $ZSH/oh-my-zsh.sh

source ~/.aliases

NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredumps;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date* --help";

function t() {
  tree --filelimit 15 -L 3 -C 
}

set editing-mode emacs

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
