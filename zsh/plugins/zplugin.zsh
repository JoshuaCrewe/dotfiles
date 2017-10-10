# Check if zplug is installed
if [[ ! -d ~/.zplugin ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zplugin/master/doc/install.sh)"
fi

### Added by Zplugin's installer
source '/Users/Joshua/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin load urbainvaes/fzf-marks                       # Bookmarking with fzf filtering

zplugin load b4b4r07/zsh-gomi                           # Move things to system trash
zplugin load zsh-users/zsh-completions

zplugin load MichaelAquilina/zsh-you-should-use

zplugin load mafredri/zsh-async
zplugin load sindresorhus/pure

# This is not installed well with zplugin
# It is not something which I particularly love using
# zplugin load pimterry/notes

zplugin load paulirish/git-open

zplugin light zdharma/fast-syntax-highlighting

autoload -Uz compinit && compinit                                                                                       
zplugin cdreplay -q
