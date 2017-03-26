# Alias'
alias lyn='learnyounode'

# I am giving up
alias :wq="exit"
alias :q="exit"

# Vim
alias vimrc='vim -c e ~/dotfiles/vimrc'
alias zshrc='vim -c e ~/dotfiles/zshrc'
alias tmuxconf='vim -c e ~/dotfiles/tmux.conf'

alias zsh-aliases='vim -c e ~/dotfiles/zsh/aliases/init.zsh'
alias zsh-plugins='vim -c e ~/dotfiles/zsh/plugins/init.zsh'
alias zsh-functions='vim -c e ~/dotfiles/zsh/functions/init.zsh'
alias zsh-options='vim -c e ~/dotfiles/zsh/options/init.zsh'

# Force tmux to start in 256 colours,
# this is actually an insane problem
alias tmux='tmux -2'

# Server
# alias server='browser-sync start -p $1 --no-ghost-mode --no-notify'

# Gomi
# alias gomi='gomi -s'
# alias trash='gomi -s'

# Ctags
alias ctags='ctags -R -f .tags .'

# FZF
alias j='jump'
alias m='mark'

#dasht
alias dt='dasht'

# cd
alias -- -='cd -'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# ls
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias ls='ls -G'

# I would like to check if the OS is linux first
### Colored ls
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
elif [ "$PLATFORM" = Darwin ]; then
  alias ls='ls -G'
fi

# PS
alias psa='ps aux'
alias psg='ps aux | grep '
alias psgg='ps aux | grep gulp'

# Git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '

alias got='git ' # Fix some fat fingers
alias get='git '

alias sz='source ~/.zshrc'

alias gsd='git difftool -y -x "colordiff -y -W $COLUMNS" | less -R'

alias t='python ~/localhost/sjl-t/t.py --task-dir ~/.tasks --list tasks'

alias show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'  # see the hidden thoughts!
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'  # keep hidden things hidden!

# Mac OS X Everywhere
if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
elif [[ "$OSTYPE" == cygwin* ]]; then
  alias o='cygstart'
  alias pbcopy='tee > /dev/clipboard'
  alias pbpaste='cat /dev/clipboard'
else
  alias o='xdg-open'

  if (( $+commands[xclip] )); then
    alias pbcopy='xclip -selection clipboard -in'
    alias pbpaste='xclip -selection clipboard -out'
  elif (( $+commands[xsel] )); then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
  fi
fi

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

# for use with notes https://github.com/pimterry/notes
alias note="notes"

# Harry Potter Fun Times
alias accio=wget
alias avadaKedavra='rm -f'
alias imperio=sudo
alias priorIncantato='echo `history |tail -n2 |head -n1` | sed "s/[0-9]* //"'
alias stupefy='sleep 5'
alias wingardiumLeviosa=mv

alias sonorus='set -v'
alias quietus='set +v'

alias colloportus='openssl enc -aes-256-cbc'  # locking spell!  $colloportus -in unencryptedName -out encryptedName
alias alohamora='openssl enc -d -aes-256-cbc'  # unlocking spell!  $alohamora -in encryptedName -out unencryptedName

alias reducio='zip -r'  # $reducio zippedName thingToZip
alias engorgio=unzip  # $engorgio zippedName

alias legilimens='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'  # see the hidden thoughts!
alias occlumens='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'  # keep hidden things hidden!

alias obliviate='history -c; history -w'  # clear bash history
alias obscuro='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'  # lock screen

alias tergeo='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'  # makes surfaces clean!
alias untergeo='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'  # (this one isn't canon)

alias expectoPatronum='open ~/Pictures/turtleBasking.jpg'  # summon your spirit animal!  (replace with a picture of your own spirit animal)

function bodyBindCurse() {
    alias cd='echo "you are immobilized!  you cannot get to"'
}

function blindingCurse() {
    alias ls='echo "you have been blinded!"'
}
