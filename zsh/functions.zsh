# Search through Firefox history ( work only at the moment )
fox() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  # this step needs to be a variable - profile is not the same on all computers.
  cp -f ~/Library/Application\ Support/Firefox/Profiles/129gnhjg.Joshua/places.sqlite /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from moz_places order by last_visit_date desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# Use FZF to search though the command line history
fh() {
eval $(history | fzf +s | sed 's/ *[0-9]* *//')
}

# List directories as a tree
function tree() {
  tree --filelimit 15 -L 3 -C 
}

# Use <c-z> to restore a suspended vim
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

# A function to search through zsh man pages
# Although I am not sure that this works
zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}
