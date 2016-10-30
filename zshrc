#   _____    _              
#  |__  /___| |__  _ __ ___ 
#    / // __| '_ \| '__/ __|
#   / /_\__ \ | | | | | (__ 
#  /____|___/_| |_|_|  \___|
#                           

# Path to your oh-my-zsh installation.
# export ZSH=~/.oh-my-zsh
export ZHOME=~/dotfiles/zsh

# source $ZSH/oh-my-zsh.sh
source $ZHOME/options.zsh
source $ZHOME/aliases.zsh
source $ZHOME/functions.zsh
source $ZHOME/plugins.zsh

# Added by zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
