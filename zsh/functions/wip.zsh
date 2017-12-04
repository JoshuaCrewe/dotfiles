# The aim is to have a function which can be bound to a keyboard shortcut,
# This can then be used in conjunction with a command which needs input.
# INtended behaviour is the <c-t> command which will search for files to use
# in a command.

function branches() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
        branch=$(echo "$branches" |
    fzf --height 40% --reverse -d $(( 2 + $(wc -l <<< "$branches") )) +m)
    return $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##"
}
zle -N branches branches
bindkey "^O"      branches

# Search through Firefox history ( work only at the moment )
function fox() {
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

# Get the commit hash to be used in whatever needs it there is a -d flag which
# designated what the delimiter is. That might be useful.  This does not get
# the commit hash yet
fcs() {
    local commits commit
    commits=$(  git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" ) &&
    commit=$(echo "$commits" | fzf --tiebreak=index --ansi --no-sort --reverse) &&
    echo -n $(echo "$commit" | sed "s/ .*//")
}
