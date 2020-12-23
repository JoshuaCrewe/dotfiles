function fkill
    set -l pid (ps -e | awk -F ' ' '{$2=$3=""; print $0}' | fzf -m --height 10% --reverse | awk '{print $1}')

    if test "x$pid" != "x"
        kill $pid
    end
end
