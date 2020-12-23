function gr
    if not command git rev-parse --git-dir > /dev/null 2>/dev/null
        return 1
    end
    set -l _root_dir (git rev-parse --show-toplevel)
    cd $_root_dir
end
