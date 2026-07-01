#!/usr/bin/env bash

# Quit all running waybar instances
pkill waybar
sleep 0.5


FIREBAR_STATE_KEY="/me/leswell/firebar-toggle"

# Check if waybar-disabled file exists
if [ "$(dconf read "$FIREBAR_STATE_KEY")" == "true" ]; then 
    firebar
fi