if [[ ! -d $HOME/.local/share/zsh/plugins ]]; then
    mkdir -p "$HOME/.local/share/zsh/plugins"
fi

if [[ ! -f $HOME/.local/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]]; then
    command git clone https://github.com/zdharma-continuum/fast-syntax-highlighting $HOME/.local/share/zsh/plugins/fast-syntax-highlighting/
fi
source $HOME/.local/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

if [[ ! -f $HOME/.local/share/zsh/plugins/fzf-marks/fzf-marks.plugin.zsh ]]; then
    command git clone https://github.com/urbainvaes/fzf-marks.git $HOME/.local/share/zsh/plugins/fzf-marks
fi
source $HOME/.local/share/zsh/plugins/fzf-marks/fzf-marks.plugin.zsh

if [[ ! -f $HOME/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    command git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.local/share/zsh/plugins/zsh-autosuggestions
fi
source $HOME/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

if [[ ! -d $HOME/.local/share/zsh/plugins/pure/ ]]; then
    command git clone https://github.com/sindresorhus/pure.git $HOME/.local/share/zsh/plugins/pure
fi
fpath+=$HOME/.local/share/zsh/plugins/pure
autoload -U promptinit; promptinit
prompt pure


autoload -U zcalc
function __calc_plugin {
    zcalc -f -e "$*"
}
aliases[calc]='noglob __calc_plugin'
aliases[=]='noglob __calc_plugin'

function update-zsh-plugins() {
    for plug in $HOME/.local/share/zsh/plugins/*; do
        echo "update $(basename $plug)"
        bash -c "cd $plug && git pull"
    done
}
