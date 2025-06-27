#!/usr/bin/env bash

# TODO: to be created, external monitor contorl


options="Turn On Display (DDCUTIL)\n Turn off display"
selected=$(echo -e $options | wofi --dmenu --prompt="Power Menu" --width=200 --height=200 )

case $selected in
  '⏻ Shutdown')
    confirm=$(echo -e "Yes\nNo" | wofi --dmenu --prompt="Shutdown?" --width=150 --height=100)
    [ "$confirm" = "Yes" ] && systemctl poweroff
    ;;
  '󰜉 Reboot')
    confirm=$(echo -e "Yes\nNo" | wofi --dmenu --prompt="Reboot?" --width=150 --height=100)
    [ "$confirm" = "Yes" ] && systemctl reboot
    ;;
  '󰗽 Logout')
    confirm=$(echo -e "Yes\nNo" | wofi --dmenu --prompt="Logout?" --width=150 --height=100)
    [ "$confirm" = "Yes" ] && uwsm stop  # Replace with `hyprctl dispatch exit` for Hyprland
    ;;
  '󰏥 Suspend')
    confirm=$(echo -e "Yes\nNo" | wofi --dmenu --prompt="Suspend?" --width=150 --height=100)
    [ "$confirm" = "Yes" ] && systemctl suspend
    ;;
  ' Lock')
    hyprlock  # Or use your preferred screen locker
    ;;
esac