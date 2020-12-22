set -U foreground d0d0d0
set -U background 3a3a3a

set -U black0 4e4e4e
set -U black1 626262

set -U red0 d68787
set -U red1 d75f87

set -U green0 5f865f
set -U green1 87af87

set -U yellow0 d8af5f
set -U yellow1 ffd787

set -U blue0 85add4
set -U blue1 add4fb

set -U magenta0 d7afaf
set -U magenta1 ffafaf

set -U cyan0 87afaf
set -U cyan1 87d7d7

set -U white0 $foreground
set -U white1 e4e4e4

# https://fishshell.com/docs/current/index.html#variables-color

set -U fish_color_normal $white0 
set -U fish_color_command $green0 # cat
set -U fish_color_quote $yellow0 # 'this is a quote'
set -U fish_color_operator $blue0 # && $HOME
set -U fish_color_comment $black1

fish_vi_key_bindings

set -U  pure_symbol_prompt '$'
set -U  pure_symbol_reverse_prompt 'λ'

abbr :q exit
abbr vi vim

set PATH $HOME/dotfiles/bin /usr/local/opt/php@7.4/bin /usr/local/opt/curl/bin $HOME/.cargo/bin $HOME/.composer/vendor/bin $PATH

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

alias pocket="feeds-to-pocket $HOME/.docs/config/feeds-to-pocket.yaml"
alias getpocket="open https://getpocket.com"

alias rsync="command rsync -vzcrSLh"

abbr g 'git'


function gr
    if not command git rev-parse --git-dir > /dev/null 2>/dev/null
        return 1
    end
    set -l _root_dir (git rev-parse --show-toplevel)
    cd $_root_dir
end

abbr j fzm
abbr m mark
