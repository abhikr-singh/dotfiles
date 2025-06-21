#!/bin/bash

entries=" Lock\n⏾ Suspend\n Reboot\n Shutdown\n Logout"

selected=$(echo -e "$entries" | rofi -dmenu -i -p "Power Menu" -config ~/.config/rofi/config.rasi)

case $selected in
" Lock")
	i3lock -i ~/Pictures/wallpapers/adventure.jpg
	;;
"⏾ Suspend")
	systemctl suspend
	;;
" Reboot")
	systemctl reboot
	;;
" Shutdown")
	systemctl poweroff
	;;
" Logout")
	i3-msg exit
	;;
*)
	exit 1
	;;
esac
