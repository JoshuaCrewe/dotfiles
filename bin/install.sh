#!/usr/bin/env bash

set -u # error out if variable is not set
set -e # exit if returns non true

IS_LINUX=0
IS_MAC=0

if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
fi

# I dont want to accidentally run this yet
exit

# [X] Set up packagemanager ( Homebrew )
# [X] Download Packages ( Create Brewfile )
# [X] Bootstrap dotfiles ( home folder, .config ) - back up existing if exist
# [X] Set up zsh as default shell
# [X] Install zsh plugins
# [ ] set up yarn and install packages
# [ ] Clean up ?

#   ___         _                                                   
#  | _ \__ _ __| |____ _ __ _ ___ _ __  __ _ _ _  __ _ __ _ ___ _ _ 
#  |  _/ _` / _| / / _` / _` / -_) '  \/ _` | ' \/ _` / _` / -_) '_|
#  |_| \__,_\__|_\_\__,_\__, \___|_|_|_\__,_|_||_\__,_\__, \___|_|  
#                       |___/                         |___/        

# TODO: Make a Brewfile with the much needed packages in it

# If Homebrew is not installed
if ! which brew > /dev/null; then
     # Install Homebrew
     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# Update brew
brew update

# Install everything in Brewfile
brew bundle

#   ___           _      _                   ___      _    __ _ _        
#  | _ ) ___  ___| |_ __| |_ _ _ __ _ _ __  |   \ ___| |_ / _(_) |___ ___
#  | _ \/ _ \/ _ \  _(_-<  _| '_/ _` | '_ \ | |) / _ \  _|  _| | / -_|_-<
#  |___/\___/\___/\__/__/\__|_| \__,_| .__/ |___/\___/\__|_| |_|_\___/__/
#                                    |_|                                

# TODO: Check if any of the files already exist. If they do then make a backup of them.

ignore="Brewfile.work Brewfile.home Brewfile README.md .git .gitignore bin config vimfx vimium.txt .DS_Store";

if [[ $IS_MAC == 1 ]]; then
    ignore="${ignore} fluxbox Xresources Xmodmap xbindkeysrc xinitrc"
fi

if [[ $IS_LINUX == 1 ]]; then
    ignore="${ignore} hammerspoon"
fi

for filename in *; do
    if [[ ! $ignore =~ $filename ]]; then
        mv "$filename" "$(HOME)/.$filename"
    fi
done

if [ ! -d "${HOME}/.config" ]; then
    mkdir "${HOME}/.config"
fi

for filename in config/*; do
    if [[ ! $ignore =~ $filename ]]; then
        mv "$filename" "$(HOME)/.config/$filename"
    fi
done

#   ___ _        _ _ 
#  / __| |_  ___| | |
#  \__ \ ' \/ -_) | |
#  |___/_||_\___|_|_|
                  
# Set zsh as default shell
chsh -s $(which zsh)

# Kick it into action ?
source $(HOME)/.zshrc

#   _  _         _       ___         _                    
#  | \| |___  __| |___  | _ \__ _ __| |____ _ __ _ ___ ___
#  | .` / _ \/ _` / -_) |  _/ _` / _| / / _` / _` / -_|_-<
#  |_|\_\___/\__,_\___| |_| \__,_\__|_\_\__,_\__, \___/__/
#                                            |___/       

if ! which yarn > /dev/null; then
    while read in; do yarn global add "$in"; done < node-packages.txt
fi

# Notes :
# http://www.davidpashley.com/articles/writing-robust-shell-scripts/
# https://www.shellcheck.net/
# http://www.patorjk.com/software/taag/#p=display&f=Small&t=Type%20Something%20
