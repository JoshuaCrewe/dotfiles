#   _____    _              
#  |__  /___| |__  _ __ ___ 
#    / // __| '_ \| '__/ __|
#   / /_\__ \ | | | | | (__ 
#  /____|___/_| |_|_|  \___|
#                           

source ~/dotfiles/zsh/widgets/init.zsh

source ~/dotfiles/zsh/options/init.zsh

source ~/dotfiles/zsh/aliases/init.zsh

source ~/dotfiles/zsh/functions/init.zsh

source ~/dotfiles/zsh/plugins/init.zsh

# source ~/dotfiles/zsh/prompt/init.zsh

# They say not to do this but it fixes the colour issues in programs like mutt
# and cmus. If any one knows howto fix this another way then I am all ears
TERM=screen-256color


# Turn off flow control so <c-s> can save in vim
# Dont know why this works
stty -ixon

# Added by fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
