# fkill - kill process
function fkill() {
    pid=$(ps -e | awk -F ' ' '{$2=$3=""; print $0}' | fzf -m --height 10% --reverse | awk '{print $1}')

    if [ "x$pid" != "x" ]
    then
        kill -${1:-9} $pid
    fi
}

function extract {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1  ;;
          *.tar.gz)    tar xzf $1  ;;
          *.bz2)       bunzip2 $1  ;;
          *.rar)       unrar x $1    ;;
          *.gz)        gunzip $1   ;;
          *.tar)       tar xf $1   ;;
          *.tbz2)      tar xjf $1  ;;
          *.tgz)       tar xzf $1  ;;
          *.zip)       unzip $1   ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1  ;;
          *)        echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}

# Makes a directory and changes to it.
function take {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# Changes to a directory and lists its contents.
function cdls {
  builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Get some colour in Man pages
function man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		PAGER="${commands[less]:-$PAGER}" \
		_NROFF_U=1 \
		PATH="$HOME/bin:$PATH" \
			man "$@"
}

function jump-to-git-root {
    local _root_dir="$(git rev-parse --show-toplevel 2>/dev/null)"
    if [[ $? -gt 0 ]]; then
        >&2 echo 'Not a Git repo!'
        exit 1
    fi
    local _pwd=$(pwd)
    if [[ $_pwd = $_root_dir ]]; then
        # Handle submodules:
        # If parent dir is also managed under Git then we are in a submodule.
        # If so, cd to nearest Git parent project.
        _root_dir="$(git -C $(dirname $_pwd) rev-parse --show-toplevel 2>/dev/null)"
        if [[ $? -gt 0 ]]; then
            printf "\r\033[2K  [ \033[00;32mDONE\033[0m ] Already at Git repo root\n"
            return 0
        fi
    fi
    # Make `cd -` work.
    OLDPWD=$_pwd
	printf "\r\033[2K  [ \033[00;32mDONE\033[0m ] Moved to $_root_dir\n"
    cd $_root_dir
}

# Make short alias
alias gr=jump-to-git-root


function setup-nodenv {
    if which nodenv >/dev/null 2>&1; then
        eval "$(nodenv init -)"
    fi
}
