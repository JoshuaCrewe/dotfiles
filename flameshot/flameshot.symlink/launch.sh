#!/usr/bin/env sh

# Terminate already running bar instances
killall -q flameshot

# Wait until the processes have been shut down
while pgrep -u $UID -x flameshot >/dev/null; do sleep 1; done

# Launch bar
flameshot 1>/dev/null 2>/dev/null &
