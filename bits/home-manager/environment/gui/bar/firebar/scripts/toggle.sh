#!/usr/bin/env bash

FIREBAR_STATE_KEY="/me/leswell/firebar-toggle"

# Check the current state using dconf
if [ "$(dconf read "$FIREBAR_STATE_KEY")" == "true" ]; then
    # If Waybar is disabled, enable it by setting the key to false
    dconf write "$FIREBAR_STATE_KEY" "false"
else
    # If Waybar is enabled, disable it by setting the key to true
    dconf write "$FIREBAR_STATE_KEY" "true"
fi

~/.config/firebar/launch.sh &
