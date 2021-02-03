function setup_nodenv
    status --is-interactive; and source (nodenv init -|psub)
end
