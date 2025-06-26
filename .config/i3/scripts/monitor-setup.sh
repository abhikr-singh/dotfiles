#!/bin/sh

# Fetch xrandr output once
XRANDR_OUTPUT=$(xrandr)

# Function to get mode and rate for a given monitor
get_monitor_info() {
	echo "$XRANDR_OUTPUT" | awk -v monitor="$1" '
        $1 == monitor { getline; print $1, $2 }
    ' | tr -d '*+'
}

# Get all connected monitors
set -- $(echo "$XRANDR_OUTPUT" | awk '$2 == "connected" { print $1 }')
NUM_MONITORS=$#

# Handle layouts based on number of monitors
case $NUM_MONITORS in
1)
	monitor_1="$1"
	set -- $(get_monitor_info "$monitor_1")
	mode_1="$1"
	rate_1="$2"

	xrandr --output "$monitor_1" --primary --mode "$mode_1" --pos 0x0 --rate "$rate_1"
	;;

2)
	monitor_1="$1"
	monitor_2="$2"

	# Force monitor_1 to use 1920x1200
	mode_1="1920x1200"
	rate_1="60.00" # Adjust if needed

	set -- $(get_monitor_info "$monitor_2")
	mode_2="$1"
	rate_2="$2"

	xrandr \
		--output "$monitor_1" --primary --mode "$mode_1" --rate "$rate_1" --pos 0x0 \
		--output "$monitor_2" --mode "$mode_2" --rate "$rate_2" --right-of "$monitor_1"
	;;

*)
	echo "supports only 2 monitors"
	;;
esac
