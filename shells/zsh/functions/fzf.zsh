# use fzf to open a note
function notes-fzf {
    # find the file name with fzf
    file=$(notes find | fzf --height 40% --reverse )

    # If a note was found
    if [ ! -z $file ];
    then
        # then open it
        notes open $file
    fi
}

# FZF
# fd - cd to selected directory
# function fd() {
#     DIR=`find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf --height 40% --reverse` \
#     && cd "$DIR"
# }

# lh - cd to a project in localhost
function c() {
    DIR=`ls ${HOME}/code | fzf --height 40% --reverse --color 'bg:#1c1c1c'` \
    && cd "${HOME}/code/$DIR"
}

function q() {
    DIR=`ls ${HOME}/docs/quotes | fzf --height 40% --reverse` \
    && cd "${HOME}/docs/quotes/$DIR"
}

# fda - including hidden directories
function fda() {
    DIR=`find ${1:-.} -type d 2> /dev/null | fzf --height 40% --reverse` && cd "$DIR"
}

# fbr - checkout git branch
function fbr() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
        branch=$(echo "$branches" |
    fzf --height 40% --reverse -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
        git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
function fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l40 -- --no-hscroll --ansi +m -d "\t" -n 2 -1 -q "$*") || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fshow - git commit browser
function fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --header "Press CTRL-S to toggle sort" \
      --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                 xargs -I % sh -c 'git show --color=always % | head -$LINES '" \
      --bind "enter:execute:echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
              xargs -I % sh -c 'vim fugitive://\$(git rev-parse --show-toplevel)/.git//% < /dev/tty'"
}

# ftags - search ctags
function ftags() {
  local line
  [ -e tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-$COLUMNS | fzf --nth=2 --tiebreak=begin
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}

# Switch tmux-sessions
function fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf-tmux --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

# This does not get the commit hash yet
fcs() {
    local commits commit
    commits=$(  git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" ) &&
    commit=$(echo "$commits" | fzf --tiebreak=index --ansi --no-sort --reverse) &&
    echo -n $(echo "$commit" | sed "s/ .*//")
}

function fzf-down() {
  fzf --height 50% "$@" --border
}

function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

function gff() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

function gfb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -200' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

function gft() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -200'
}

function gfh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -200' |
  grep -o "[a-f0-9]\{7,\}"
}

function gfr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

# Use FZF to search though the command line history
function fh() {
eval $(history | fzf +s | sed 's/ *[0-9]* *//')
}
