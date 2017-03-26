# if [[ -f ~/.zpm/zpm.zsh ]]; then
#     source ~/.zpm/zpm.zsh
# else
#     git clone --recursive https://github.com/horosgrisa/zpm ~/.zpm
#     source ~/.zpm/zpm.zsh
#   fi
#
# Plug mafredri/zsh-async                         # For the pure promt to work
# Plug sindresorhus/pure                          # A minimalist prompt
#
# Plug urbainvaes/fzf-marks                       # Bookmarking with fzf filtering
# Plug b4b4r07/zsh-gomi                           # Move things to system trash
# Plug zsh-users/zsh-completions
#
# Plug git
# Plug genpasswd
#
# Plug zsh-users/zsh-syntax-highlighting

# I was goint to try notes but I am not so sure.
if [[ -f /usr/local/bin/notes ]]; then
    
else
    curl https://cdn.rawgit.com/pimterry/notes/v0.2.0/notes > /usr/local/bin/notes && chmod +x /usr/local/bin/notes
fi

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    brew install zplug
    source ~/.zplug/init.zsh && zplug update --self
  fi

source ~/.zplug/init.zsh

zplug "zplug/zplug"                                # Have zplug manage its self
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # Use colour to show acutal commands
zplug "urbainvaes/fzf-marks"                       # Bookmarking with fzf filtering

zplug "b4b4r07/zsh-gomi"                           # Move things to system trash
zplug "zsh-users/zsh-completions"

zplug "mafredri/zsh-async"                         # For the pure promt to work
zplug "sindresorhus/pure"                          # A minimalist prompt

zplug "witt3rd/894c9e0b9ca4e24e5574", \
    from:gist, \
    as:command, \
    use:brew-sync.sh                               # Keep homebrew in sync with dropbox

# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
zplug load # --verbose

