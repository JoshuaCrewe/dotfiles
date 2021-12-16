if [[ ! -d $HOME/.config/zsh ]]; then
    mkdir -p "$HOME/.config/zsh"
fi

if [[ ! -f $HOME/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]]; then
    command git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $HOME/.config/zsh/fast-syntax-highlighting/
fi
source $HOME/.config/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

if [[ ! -f $HOME/.config/zsh/fzf-marks/fzf-marks.plugin.zsh ]]; then
    command git clone https://github.com/urbainvaes/fzf-marks.git $HOME/.config/zsh/fzf-marks
fi
source $HOME/.config/zsh/fzf-marks/fzf-marks.plugin.zsh

if [[ ! -f $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    command git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.config/zsh/zsh-autosuggestions
fi
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [[ ! -d $HOME/.config/zsh/pure/ ]]; then
    command git clone https://github.com/sindresorhus/pure.git $HOME/.config/zsh/pure
fi
fpath+=$HOME/.config/zsh/pure
autoload -U promptinit; promptinit
prompt pure
