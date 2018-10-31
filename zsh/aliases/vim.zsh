# Vim {{
    if hash nvim 2>/dev/null; then
        # alias vim='nvim'
    fi
    alias vi='vim'
    alias vimrc='vim -c e ~/dotfiles/vim/vimrc.symlink'
    alias zshrc='vim -c e ~/dotfiles/zsh/zshrc.symlink'
    alias tmuxconf='vim -c e ~/dotfiles/tmux/tmux.conf.symlink'

    alias zsh-aliases='vim -c e ~/dotfiles/zsh/aliases/init.zsh'
    alias zsh-plugins='vim -c e ~/dotfiles/zsh/plugins/init.zsh'
    alias zsh-functions='vim -c e ~/dotfiles/zsh/functions/init.zsh'
    alias zsh-options='vim -c e ~/dotfiles/zsh/options/init.zsh'

    alias vimagit='vim -c Magit -c only'

    # Shhh dont tell anyone
    alias ed='emacs'
# }}
