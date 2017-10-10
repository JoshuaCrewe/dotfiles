# Vim {{
    if hash nvim 2>/dev/null; then
        alias vim='nvim'
    fi
    alias vi='vim'
    alias vimrc='vim -c e ~/dotfiles/vimrc'
    alias zshrc='vim -c e ~/dotfiles/zshrc'
    alias tmuxconf='vim -c e ~/dotfiles/tmux.conf'

    alias zsh-aliases='vim -c e ~/dotfiles/zsh/aliases/init.zsh'
    alias zsh-plugins='vim -c e ~/dotfiles/zsh/plugins/init.zsh'
    alias zsh-functions='vim -c e ~/dotfiles/zsh/functions/init.zsh'
    alias zsh-options='vim -c e ~/dotfiles/zsh/options/init.zsh'

    # Shhh dont tell anyone
    alias ed='emacs'
# }}
