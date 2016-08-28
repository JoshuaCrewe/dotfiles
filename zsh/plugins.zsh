# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
  fi

source ~/.zplug/init.zsh

zplug "zplug/zplug"                                # Have zplug manage its self
zplug "plugins/git", \
  from:oh-my-zsh, \
  ignore:oh-my-zsh.sh                              # Git alias'
zplug "plugins/git-extras", \
  from:oh-my-zsh, \
  ignore:oh-my-zsh.sh                              # Git extras
zplug "plugins/colored-man-pages", \
  from:oh-my-zsh, \
  ignore:oh-my-zsh.sh                              # Get some colour for those man pages
zplug "plugins/z", \
  from:oh-my-zsh, \
  ignore:oh-my-zsh.sh                              # Frecent directory searching
zplug "andrewferrier/fzf-z"                        # Use fzf for frecent directories
zplug "b4b4r07/enhancd", use:init.sh               # Fzf for changing directory
zplug "zsh-users/zsh-syntax-highlighting", nice:10 # Use colour to show acutal commands
zplug "supercrabtree/k"                            # List files and folders with more info ( like git )
zplug "urbainvaes/fzf-marks"                       # Bookmarking with fzf filtering
zplug "b4b4r07/emoji-cli", use:emoji-cli.zsh       # Find the right emoji
zplug "mrowa44/emojify", as:command                # change :emoji: into emoji

zplug "mafredri/zsh-async"                         # For the pure promt to work
zplug "sindresorhus/pure"                          # A minimalist prompt

zplug "witt3rd/894c9e0b9ca4e24e5574", \
    from:gist, \
    as:command, \
    use:brew-sync.sh                               # Keep homebrew in sync with dropbox

zplug "b4b4r07/zsh-gomi", if:"which fzf"           # Move things to system trash

# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
