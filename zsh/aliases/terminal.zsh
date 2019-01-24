# cd {{
    alias -- -='cd -'
    alias -g ...='../..'
    alias -g ....='../../..'
    alias -g .....='../../../..'
    alias -g ......='../../../../..'
# }}

# ls {{
    alias lsa='ls -lah'
    alias l='ls -lah'
    alias ll='ls -lh'
    alias la='ls -lAh'
    alias ls='ls -G'
# }}

# I am giving up
alias :wq="exit"
alias :q="exit"

alias lyn='learnyounode'

# Force tmux to start in 256 colours,
# this is actually an insane problem
alias tmux='tmux -2'

# FZF
alias j='jump'
alias m='mark'

#dasht
alias dt='dasht'

# I would like to check if the OS is linux first
### Colored ls
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
elif [[ $IS_MAC == 1 ]]; then
  alias ls='ls -G'
fi

# PS {{
    alias psa='ps aux'
    alias psg='ps aux | grep '
    alias psgg='ps aux | grep gulp'
# }}

alias sz='source ~/.zshrc'
