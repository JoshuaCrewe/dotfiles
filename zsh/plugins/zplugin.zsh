# Check if zplug is installed
if [[ ! -d ~/.zplugin ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zplugin/master/doc/install.sh)"
fi

### Added by Zplugin's installer
source ${HOME}'/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin light urbainvaes/fzf-marks                       # Bookmarking with fzf filtering

zplugin light b4b4r07/zsh-gomi                           # Move things to system trash
zplugin light zsh-users/zsh-completions

zplugin light MichaelAquilina/zsh-you-should-use

zplugin light mafredri/zsh-async
zplugin light sindresorhus/pure

# zplugin load pimterry/notes
zplugin snippet --command https://github.com/pimterry/notes/blob/master/notes

zplugin light paulirish/git-open

zplugin light zdharma/fast-syntax-highlighting

# https://github.com/zplugin/z-a-bin-gem-node
zplugin light zplugin/z-a-bin-gem-node

# https://zdharma.org/2019-10-27/Installing-Gems-And-Node-Modules-With-Zplugin
# zplugin ice node'!pen' sbin'node_modules/.bin/pen'
# zplugin load zdharma/null


zplugin id-as'node-modules' node'pen;heroku;pnpm;' \
       sbin'node_modules/.bin/{pen,heroku,pnpm}' for \
          zdharma/null
zplugin load zdharma/null

autoload -Uz compinit && compinit                                                                                       
zplugin cdreplay -q
