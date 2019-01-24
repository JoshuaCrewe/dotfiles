# Vagrant Aliases
alias vs="cd ~/vagrant && vagrant ssh"
alias vc="cd ~/vagrant && vagrant ssh -c"
alias vu="cd ~/vagrant && vagrant up && cd -"
alias vh="cd ~/vagrant && vagrant halt && cd -"
alias vp="cd ~/vagrant && vagrant provision && cd -"
alias vrn="cd ~/vagrant && vagrant ssh -c 'sudo nginx -s reload' && cd -"
alias vn="sudo vim -O ~/vagrant/Sites.yaml /etc/hosts"
