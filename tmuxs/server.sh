#!/usr/bin/env bash
set -u # error out if variable is not set
set -e # exit if returns non true

function tmux_mail {
    SESSION_NAME="server"

    # Start a new session with the name as the project and cal the window 'CODE'
    tmux new-session -s $SESSION_NAME -n "SERVER" -d

    # Split the window horizontally
    tmux split-window -t $SESSION_NAME -h

    # Check RSS
    tmux send-keys -t $SESSION_NAME "pocket" C-m

    # Split the window vertically
    tmux split-window -v -t "$SESSION_NAME"


    if [[ !  -x "$(cd ~/vagrant && vagrant ssh -c pwd)" ]]; then
        tmux send-keys -t "$SESSION_NAME" "cd ~/vagrant && vagrant up --provision" C-m
    fi

    # Focus the pane with mail in it
    tmux select-pane -t ${SESSION_NAME}:1.1

    # Attach to the new project
    tmux switch -t "$SESSION_NAME" || tmux attach -t "$SESSION_NAME"
}

tmux_mail
