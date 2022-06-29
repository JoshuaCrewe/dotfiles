if hash nvim 2>/dev/null; then
    alias vim='nvim -u ~/.config/nvim/init.vim'
fi
alias vimx='nvim -u ~/.config/vimx/init.lua'

alias vi='vim'
alias vimrc='vim -c e ~/dotfiles/vim/vimrc.symlink'
alias zshrc='vim -c e ~/dotfiles/zsh/zshrc.symlink'
alias tmuxconf='vim -c e ~/dotfiles/tmux/tmux.conf.symlink'
