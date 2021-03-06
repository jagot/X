#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for monitor in $(polybar -m | cut -d: -f1); do
    MONITOR=$monitor polybar example &
done
