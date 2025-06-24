#!/usr/bin/env sh
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar primary &

# Detect second monitor (excluding eDP-1, the common laptop screen)
SECOND_MONITOR=$(xrandr --query | grep ' connected' | grep -v eDP-1 | awk '{ print $1 }' | head -n1)
if [ -n "$SECOND_MONITOR" ]; then
  export SECOND_MONITOR=$SECOND_MONITOR
  polybar secondary &
fi
