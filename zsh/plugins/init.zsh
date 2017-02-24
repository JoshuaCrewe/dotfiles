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
Plug zsh-users/zsh-completions

Plug git
Plug genpasswd

Plug zsh-users/zsh-syntax-highlighting

# I was goint to try notes but I am not so sure.
if [[ -f /usr/local/bin/notes ]]; then
    
else
    curl https://raw.githubusercontent.com/JoshuaCrewe/notes/master/notes > /usr/local/bin/notes && chmod +x /usr/local/bin/notes
fi

