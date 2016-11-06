if [[ -f ~/.zpm/zpm.zsh ]]; then
    source ~/.zpm/zpm.zsh
else
    git clone --recursive https://github.com/horosgrisa/zpm ~/.zpm
    source ~/.zpm/zpm.zsh
  fi


Plug mafredri/zsh-async                         # For the pure promt to work
Plug sindresorhus/pure                          # A minimalist prompt

Plug urbainvaes/fzf-marks                       # Bookmarking with fzf filtering
Plug b4b4r07/zsh-gomi                           # Move things to system trash

Plug git
Plug genpasswd

Plug zsh-users/zsh-syntax-highlighting