source ~/dotfiles/zsh/aliases/git.zsh 
source ~/dotfiles/zsh/aliases/system.zsh 
source ~/dotfiles/zsh/aliases/vim.zsh 
source ~/dotfiles/zsh/aliases/terminal.zsh 
source ~/dotfiles/zsh/aliases/harrypotter.zsh 
source ~/dotfiles/zsh/aliases/linux.zsh 

# Vagrant Aliases
alias vs="cd ~/vagrant && vagrant ssh"
alias vc="cd ~/vagrant && vagrant ssh -c"
alias vu="cd ~/vagrant && vagrant up && cd -"
alias vh="cd ~/vagrant && vagrant halt && cd -"
alias vp="cd ~/vagrant && vagrant provision && cd -"
alias vn="sudo vim -O ~/vagrant/Sites.yaml /etc/hosts"
