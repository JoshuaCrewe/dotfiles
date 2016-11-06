#   _____    _              
#  |__  /___| |__  _ __ ___ 
#    / // __| '_ \| '__/ __|
#   / /_\__ \ | | | | | (__ 
#  /____|___/_| |_|_|  \___|
#                           

# Path to your oh-my-zsh installation.
# export ZSH=~/.oh-my-zsh

# source $ZSH/oh-my-zsh.sh

# source ~/dotfiles/zsh/options.zsh
source ~/dotfiles/zsh/options/init.zsh

# source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/aliases/init.zsh

# source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/functions/init.zsh

# source ~/dotfiles/zsh/plugins.zsh
source ~/dotfiles/zsh/plugins/init.zsh

# They say not to do this but it fixes the colour issues in programs like mutt
# and cmus. If any one knows howto fix this another way then I am all ears
TERM=screen-256color

# Added by zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
