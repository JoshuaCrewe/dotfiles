if [[ -f ${HOME}/.zgen/zgen.zsh ]]; then
	source ${HOME}/.zgen/zgen.zsh
else
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
	source ${HOME}/.zgen/zgen.zsh
fi

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load urbainvaes/fzf-marks                       # Bookmarking with fzf filtering

    zgen load b4b4r07/zsh-gomi                           # Move things to system trash
    zgen load zsh-users/zsh-completions

    zgen load MichaelAquilina/zsh-you-should-use

    zgen load pimterry/notes
    zgen load paulirish/git-open

    zgen load mafredri/zsh-async                         # For the pure promt to work
    zgen load sindresorhus/pure                          # A minimalist prompt
    # plugins
    zgen load zsh-users/zsh-syntax-highlighting


    # save all to init script
    zgen save
fi
