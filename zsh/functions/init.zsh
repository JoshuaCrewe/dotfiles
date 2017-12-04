source ~/dotfiles/zsh/functions/fzf.zsh
source ~/dotfiles/zsh/functions/general.zsh
source ~/dotfiles/zsh/functions/wip.zsh

# Synchronise pass account
function psync() {
  pass git pull origin master
  pass git push origin master
  pass git push backup master
}
