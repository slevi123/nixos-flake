#!/usr/bin/env bash

ASHELL_STATE_KEY="/me/leswell/ashell-toggle"

# Check the current state using dconf
if [ "$(dconf read "$ASHELL_STATE_KEY")" == "true" ]; then
    # If ashell is disabled, enable it by setting the key to false
    dconf write "$ASHELL_STATE_KEY" "false"
else
    # If ashell is enabled, disable it by setting the key to true
    dconf write "$ASHELL_STATE_KEY" "true"
fi

# Quit all running ashell instances
killall ashell
pkill ashell
sleep 0.5

# Check if ashell-disabled file exists
if [ "$(dconf read "$ASHELL_STATE_KEY")" == "true" ]; then 
    ashell
fi


