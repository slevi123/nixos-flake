#!/usr/bin/env bash

WAYBAR_STATE_KEY="/me/leswell/waybar-toggle"

# Check the current state using dconf
if [ "$(dconf read "$WAYBAR_STATE_KEY")" == "true" ]; then
    # If Waybar is disabled, enable it by setting the key to false
    dconf write "$WAYBAR_STATE_KEY" "false"
else
    # If Waybar is enabled, disable it by setting the key to true
    dconf write "$WAYBAR_STATE_KEY" "true"
fi

~/.config/waybar/launch.sh &
