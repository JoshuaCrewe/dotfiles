# system {{
    if [[ $IS_MAC == 1 ]]; then
        alias show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'  # see the hidden thoughts!
        alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'  # keep hidden things hidden!
    fi

    # Mac OS X Everywhere
    if [[ $IS_MAC == 1 ]]; then
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

    # Gomi
    if [[ $IS_MAC == 1 ]]; then
        alias trash='gomi -s'
    fi
# }}
