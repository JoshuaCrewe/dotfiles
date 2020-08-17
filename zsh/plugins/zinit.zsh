# Check if zplug is installed
if [[ ! -d ~/.zinit ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit light urbainvaes/fzf-marks # Bookmarking with fzf filtering

zinit light b4b4r07/zsh-gomi # Move things to system trash
zinit light zsh-users/zsh-completions

zinit light MichaelAquilina/zsh-you-should-use

zinit light mafredri/zsh-async
zinit light sindresorhus/pure

# zplugin load pimterry/notes
zinit snippet --command https://github.com/pimterry/notes/blob/master/notes

zinit light paulirish/git-open

zinit light zdharma/fast-syntax-highlighting

# https://github.com/zinit-zsh/z-a-bin-gem-node
# zinit light zinit-zsh/z-a-bin-gem-node

# zinit id-as'node-modules' node'pen;heroku;' \
#        sbin'node_modules/.bin/{pen,heroku}' for \
#           zdharma/null
# zinit load zdharma/null
zinit id-as'node-modules' node'pen;heroku;fast-cli;' \
       sbin'node_modules/.bin/{pen,heroku,fast}' for \
          zdharma/null
zinit load zdharma/null

autoload -Uz compinit && compinit
zinit cdreplay -q
