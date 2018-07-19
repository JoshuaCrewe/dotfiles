#!/usr/bin/env bash
[ "$(uname -s)" != "Darwin" ] && exit 0

echo 'run iterm installer'

# defaults write com.googlecode.iterm2 "PrefsCustomFolder" -string "$DOTFILES/iterm"
# defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true
