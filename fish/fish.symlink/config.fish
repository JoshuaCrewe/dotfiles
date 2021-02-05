fish_vi_key_bindings

set -U  pure_symbol_prompt '$'
set -U  pure_symbol_reverse_prompt 'λ'

set -U  BAT_THEME 'base16'

set -U HOMEBREW_NO_GITHUB_API true


abbr :q exit
abbr vi vim

set PATH $HOME/dotfiles/bin /usr/local/opt/php@7.3/bin /usr/local/opt/curl/bin $HOME/.cargo/bin $HOME/.composer/vendor/bin $HOME/.yarn/bin $PATH

bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward
bind -M normal \cp history-search-backward
bind -M normal \cn history-search-forward

abbr vs 'cd $HOME/vagrant && vagrant ssh'
abbr vu 'cd $HOME/vagrant && vagrant up && prevd'
abbr vup 'cd $HOME/vagrant && vagrant up --provision && prevd'
abbr vh 'cd $HOME/vagrant && vagrant halt && prevd'
abbr vp 'cd $HOME/vagrant && vagrant provision && prevd'
abbr vd 'cd $HOME/vagrant && vagrant destroy && prevd'
abbr vr 'cd $HOME/vagrant && vagrant halt && vagrant up --provision && prevd'
abbr vrn 'cd $HOME/vagrant && vagrant ssh -c "sudo nginx -s reload" && prevd'
abbr vn 'vim $HOME/vagrant/Sites.yaml'
abbr vhosts 'sudo vim /etc/hosts'

alias rsync="command rsync -vzcrSLh"

abbr g 'git'

abbr j fzm
abbr m mark

set -U OS (uname)

if test $OS = 'Darwin'
    alias o='open'
else if test $OS = 'Linux'
    alias o='xdg-open'

    alias pbcopy='xclip -selection clipboard -in'
    alias pbpaste='xclip -selection clipboard -out'
end

alias pocket="feeds-to-pocket $HOME/.docs/config/feeds-to-pocket.yaml"
alias getpocket="o https://getpocket.com"

alias tmux='tmux -2'

set -U fish_escape_delay_ms 80

set -U FZF_CD_COMMAND "fd --hidden -i -E 'node_modules' -E '.git' --type directory" 
