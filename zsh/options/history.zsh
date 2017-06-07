# Set up a decent history
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredumps;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date* --help";
export HISTFILE=~/.zsh_history
