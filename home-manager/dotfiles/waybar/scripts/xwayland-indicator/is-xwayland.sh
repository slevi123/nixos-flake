#!/usr/bin/env bash

# Get active window information in JSON format
active_window_info=$(hyprctl activewindow -j)

# Check if the active window is an XWayland client
if echo "$active_window_info" | grep -q '"xwayland": true'; then
    # Output the symbol or message for XWayland clients
    echo ""
fi