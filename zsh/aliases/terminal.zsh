# cd {{
    alias -- -='cd -'
    alias -g ...='../..'
    alias -g ....='../../..'
    alias -g .....='../../../..'
    alias -g ......='../../../../..'
# }}

# ls {{
    if hash exa 2>/dev/null; then
        alias ls='exa'
        alias lsa='exa -lah'
        alias l='exa -lah'
        alias ll='exa -lh'
        alias la='exa -lAh'
    else
        alias lsa='ls -lah'
        alias l='ls -lah'
        alias ll='ls -lh'
        alias la='ls -lAh'
        alias ls='ls -G'
        if [ -x /usr/bin/dircolors ]; then
          eval "`dircolors -b`"
          alias ls='ls --color=auto'
          alias grep='grep --color=auto'
        elif [[ $IS_MAC == 1 ]]; then
          alias ls='ls -G'
        fi
    fi
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

# PS {{
    alias psa='ps aux'
    alias psg='ps aux | grep '
    alias psgg='ps aux | grep gulp'
# }}

alias sz='source ~/.zshrc'

# for use with notes https://github.com/pimterry/notes
alias note="notes"
alias fnotes="notes-fzf"

# https://github.com/FraGag/feeds-to-pocket
alias pocket="feeds-to-pocket ~/SparkleShare/gitlab.com/docs/config/feeds-to-pocket.yaml"
alias getpocket="o https://getpocket.com"

alias rsync="rsync -vzcrSLh"
