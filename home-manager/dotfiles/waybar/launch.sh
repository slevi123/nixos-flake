#!/usr/bin/env bash

# Quit all running waybar instances
killall waybar
pkill waybar
sleep 0.5


WAYBAR_STATE_KEY="/me/leswell/waybar-toggle"

# Check if waybar-disabled file exists
if [ "$(dconf read "$WAYBAR_STATE_KEY")" == "true" ]; then 
    waybar &
fi

