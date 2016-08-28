#   _____    _              
#  |__  /___| |__  _ __ ___ 
#    / // __| '_ \| '__/ __|
#   / /_\__ \ | | | | | (__ 
#  /____|___/_| |_|_|  \___|
#                           

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZHOME=~/dotfiles/zsh

source $ZSH/oh-my-zsh.sh
source $ZHOME/options.zsh
source $ZHOME/aliases.zsh
source $ZHOME/functions.zsh
source $ZHOME/plugins.zsh

# Plugins to use
# plugins=(git git-extras catimg nyan osx sublime tmux colored-man-pages k gomi)

# Theme
autoload -U promptinit && promptinit
prompt pure
