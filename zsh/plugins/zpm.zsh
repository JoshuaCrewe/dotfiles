if [[ -f ~/.zpm/zpm.zsh ]]; then
	source ~/.zpm/zpm.zsh
else
	git clone --recursive https://github.com/horosgrisa/zpm ~/.zpm
	source ~/.zpm/zpm.zsh
fi

zpm load urbainvaes/fzf-marks                       # Bookmarking with fzf filtering

zpm load b4b4r07/zsh-gomi                           # Move things to system trash
zpm load zsh-users/zsh-completions

# zpm load MichaelAquilina/zsh-you-should-use

zpm load pimterry/notes
zpm load paulirish/git-open

zpm load mafredri/zsh-async                         # For the pure promt to work
zpm load sindresorhus/pure                          # A minimalist prompt

# zpm load zsh-users/zsh-syntax-highlighting
zpm load zdharma/fast-syntax-highlighting
