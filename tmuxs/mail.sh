#!/usr/bin/env bash
set -u # error out if variable is not set
set -e # exit if returns non true

function tmux_mail {
    SESSION_NAME="mail"

    # Start a new session with the name as the project and cal the window 'CODE'
    tmux new-session -s $SESSION_NAME -n "MAIL" -d

    # open mail
    tmux send-keys -t $SESSION_NAME "mutt" C-m

    sleep .3

    # Split the window vertically
    tmux split-window -t $SESSION_NAME -h

    # Check RSS
    tmux send-keys -t $SESSION_NAME "pocket" C-m

    # Focus the pane with mail in it
    tmux select-pane -t ${SESSION_NAME}:1.1

    # Attach to the new project
    tmux switch -t "$SESSION_NAME" || tmux attach -t "$SESSION_NAME"
}

tmux_mail
