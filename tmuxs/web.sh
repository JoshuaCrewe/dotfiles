#!/usr/bin/env bash
set -u # error out if variable is not set
set -e # exit if returns non true

function tmux_web {
    SESSION_NAME=$1

    # Start a new session with the name as the project and cal the window 'CODE'
    tmux new-session -s "$SESSION_NAME" -n "CODE" -d

    # Start a new window and call it 'BUILD'
    tmux new-window -n BUILD -t "$SESSION_NAME";

    # Start the Gulp build process
    if [[ -f gulpfile.js ]]; then
        tmux send-keys -t "$SESSION_NAME" "gulp" C-m
    fi

    if [[ -f webpack.mix.js ]]; then
        tmux send-keys -t "$SESSION_NAME" "yarn watch" C-m
    fi

    # Split the window vertically
    tmux split-window -v -t "$SESSION_NAME":2

    # get the git status for the project
    tmux send-keys -t "$SESSION_NAME" "g s" C-m

    # Attach to the new project
    tmux switch -t "$SESSION_NAME" || tmux attach -t "$SESSION_NAME"
}

#new session base name is current directory name
DIR_NAME=${PWD##*/}

echo "Trying to create new Tmux session with name '$DIR_NAME'."
if ! tmux has-session -t "$DIR_NAME" 2>/dev/null
then
    echo "Session not found. Create Session '$DIR_NAME'."
    tmux_web "$DIR_NAME"
else
    echo "Trying to attach"
    tmux switch -t "$DIR_NAME" || tmux attach -t "$DIR_NAME"
fi
