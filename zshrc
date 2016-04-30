# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="pure"
#autoload -U promptinit && promptinit
#prompt pure

# Red dots for completing process'
 COMPLETION_WAITING_DOTS="true"

# Plugins to use
plugins=(git brew brew-cask catimg git-extras github lol nyan osx sublime z zsh-syntax-highlighting)

# Turn off flow control
setopt noflowcontrol
stty -ixon
stty stop undef

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:"/Applications/MAMP/Library/bin/"

source $ZSH/oh-my-zsh.sh

# Alias'
 alias zshconfig="mate ~/.zshrc"
 alias ohmyzsh="mate ~/.oh-my-zsh"
 alias gs='git status '
 alias ga='git add '
 alias gb='git branch '
 alias gc='git commit'
 alias gd='git diff'
 alias go='git checkout '

 alias got='git '
 alias get='git '

 alias ez='vim ~/.zshrc'
 alias sz='source ~/.zshrc'

 alias gsd='git difftool -y -x "colordiff -y -W $COLUMNS" | less -R'


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

set editing-mode vi
bindkey -v



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

 source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
