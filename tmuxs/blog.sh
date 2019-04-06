#!/usr/bin/env bash
set -u # error out if variable is not set
set -e # exit if returns non true

function tmux_blog {
    SESSION_NAME="blog"

    cd "${HOME}/localhost/joshuacrewe/"

    # Start a new session with the name as the project and cal the window 'CODE'
    tmux new-session -s $SESSION_NAME -n "Blog" -d

    if [[ ! -z "$@" ]]; then
        tmux send-keys -t $SESSION_NAME "hugo new post/$1/index.md" C-m
        tmux send-keys -t $SESSION_NAME "vi content/post/$1/index.md" C-m
    fi

    tmux new-window -n BUILD -t "$SESSION_NAME";

    tmux split-window -v -t "$SESSION_NAME":2

    tmux send-keys -t $SESSION_NAME "hugo serve -D" C-m

    tmux select-window -t ${SESSION_NAME}:1
    tmux select-pane -t ${SESSION_NAME}:1.1

    # Attach to the new project
    tmux switch -t "$SESSION_NAME" || tmux attach -t "$SESSION_NAME"
}


tmux_blog "$@"
