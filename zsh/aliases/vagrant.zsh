# Vagrant Aliases
alias vs="cd ~/vagrant && vagrant ssh"
alias vc="cd ~/vagrant && vagrant ssh -c"
alias vu="cd ~/vagrant && vagrant up && cd -"
alias vup="cd ~/vagrant && vagrant up --provision && cd -"
alias vh="cd ~/vagrant && vagrant halt && cd -"
alias vp="cd ~/vagrant && vagrant provision && cd -"
alias vd="cd ~/vagrant && vagrant destroy && cd -"
alias vr="cd ~/vagrant && vagrant halt && vagrant up --provision && cd -"
alias vrn="cd ~/vagrant && vagrant ssh -c 'sudo nginx -s reload' && cd -"
alias vn="vim ~/vagrant/Sites.yaml"
alias vh="sudo vim /etc/hosts"
