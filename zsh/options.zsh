# Red dots for completing process'
# COMPLETION_WAITING_DOTS="true"
# http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "\e[31m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Turn off flow control so <c-s> can save in vim
# setopt noflowcontrol
# unsetopt flowcontrol
stty -ixon
# stty stop undef

# set what gets put in PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Added by MAMP
export PATH=$PATH:"/Applications/MAMP/Library/bin/"

# Be able to npm install without sudo
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Set up a decent history
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredumps;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date* --help";

# Use emacs ( readline ) keybindings to move about text
set editing-mode emacs

# Use The Silver Searcher for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# Stuff from Prezto which looked like some good options

setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
                            # Use >! and >>! to bypass.

unsetopt menu_complete   # do not autoselect the first completion entry
setopt auto_menu         # show completion menu on succesive tab press

# case insensitive (all), partial-word and substring completion,
# basically has autocompletion work out if there should be a capital or not
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
# I think this is associated with that ... somehow.
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

# Everything below here is trying to make sense of the oh-my-zsh settings
# #######################################################################

# Set the colours for ls command
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# visually show item slect in tab complete menu on tab
zstyle ':completion:*:*:*:*:*' menu select

# Use colours for directories in autocomplete menu
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'


# zmodload -i zsh/complist

# WORDCHARS=''
#
# setopt complete_in_word
# setopt always_to_end


#
