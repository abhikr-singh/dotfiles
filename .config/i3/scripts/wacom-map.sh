#!/bin/bash
# Map Wacom to right monitor (HDMI-1-0)
# xinput set-prop "Wacom Intuos S Pen stylus" "Coordinate Transformation Matrix" 0.5 0 0.5 0 1 0 0 0 1
sleep 1
xsetwacom set "Wacom Intuos S Pen stylus" MapToOutput HEAD-1
