#!/usr/bin/env bash

EXTRA_LOG_FILE=/tmp/extra_commands.log
HISTORY_FILE="$XDG_DATA_HOME/charm/quick_menu/calculator_history.log"
MAX_HISTORY_LINES=30

SLEEP_BEFORE_SCREENSHOT=0.2
BASE_SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

# Ensure the history file exists
touch "$HISTORY_FILE"

# GROUP
option_group_togglelock="[GROUPS]: Toggle Group Lock 󰌾/"

# MONITOR
options_monitor_turn_on_ddcutil="[MONITOR]: Turn On (external) monitor using DDCUTIL"
options_monitor_turn_off_ddcutil="[MONITOR]: Turn Off (external) monitor using DDCUTIL"

# UTILITY
options_utility_colorpicker="[UTILITY]: Color Picker"
options_utility_calculator="[UTILITY]: Calculator"
options_utility_drun="[UTILITY]: Desktop Run Menu"
options_utility_run="[UTILITY]: Run Menu"

# SCREENSHOT
options_ss_region="[HYPRSHOT]: Screenshot Region"
options_ss_window="[HYPRSHOT]: Screenshot Window"
options_ss_monitor="[HYPRSHOT]: Screenshot Monitor"
options_ss_region_clipboard="[HYPRSHOT]: Screenshot Region to clipboard"
options_ss_window_clipboard="[HYPRSHOT]: Screenshot Window to clipboard"
options_ss_monitor_clipboard="[HYPRSHOT]: Screenshot Monitor to clipboard"

# PIN WINDOWS
options_hyprland_toogle_pin="[HYPRLAND]: Pin floating window (Show on all workspaces)"
# TAGS

# Volume / Light Control
# Keyboard backlight controll
# Music controll

options="\
$option_group_togglelock\n\
$options_monitor_turn_on_ddcutil\n\
$options_monitor_turn_off_ddcutil\n\
$options_utility_colorpicker\n\
$options_utility_calculator\n\
$options_utility_drun\n\
$options_utility_run\n\
$options_ss_region\n\
$options_ss_window\n\
$options_ss_monitor\n\
$options_ss_region_clipboard\n\
$options_ss_window_clipboard\n\
$options_ss_monitor_clipboard\n\
$options_hyprland_toogle_pin\
"
selected=$(echo -e $options | wofi --dmenu --prompt="Quick Menu" --lines --width=75% )

selected="${selected%"${selected##*[![:space:]]}"}"  # Trim trailing whitespace
selected="${selected#"${selected%%[![:space:]]*}"}"  # Trim leading whitespace

strip_equals() {
    local input="$1"
    local remaining

    case "$input" in
        =*)
            remaining="${input#=}"  # Strip leading '='
            # Strip leading whitespace (spaces/tabs)
            remaining="${remaining#"${remaining%%[![:space:]]*}"}"
            ;;
        *)
            remaining="$input"  # No '=' prefix, return as-is
            ;;
    esac

    echo "$remaining"  # Output the result
}

calculator() {
  local problem="$1"
  answer=$(qalc "$problem" 2>$EXTRA_LOG_FILE)

  # history=$(cat "$HISTORY_FILE") 
  history=$(tail -n $(("$MAX_HISTORY_LINES"-1)) "$HISTORY_FILE")
  echo -e "$answer\n------------History---------------\n$history"  | wofi --dmenu  >>$EXTRA_LOG_FILE 2>&1

  echo "$answer\n$history" > "$HISTORY_FILE"
}

case $selected in
  "")
    # preventing the unkown command prompt if cancel
    ;;
  "$option_group_togglelock")
    hyprctl dispatch lockactivegroup 'toggle' >>$EXTRA_LOG_FILE 2>&1
    ;;
  "$options_monitor_turn_on_ddcutil")
    ddcutil setvcp D6 01 >>$EXTRA_LOG_FILE 2>&1
    ;;
  "$options_monitor_turn_off_ddcutil")
    ddcutil setvcp D6 05 >>$EXTRA_LOG_FILE 2>&1
    ;;
  "$options_utility_colorpicker")
    sleep 0.3
    hyprpicker
    ;;
  "$options_utility_calculator")
    history=$(cat "$HISTORY_FILE")
    problem=$(echo -e $history | wofi --dmenu --prompt="Write Expression" --height=50% --width=75% )
    calculator "$problem"
    ;;
  "$options_utility_drun")
    wofi --show=drun --height=80% --width=70% >>$EXTRA_LOG_FILE 2>&1
    ;;
  "$options_utility_run")
    wofi --show=run --height=80% --width=70% >>$EXTRA_LOG_FILE 2>&1
    ;;
  "$options_ss_region")
    sleep $SLEEP_BEFORE_SCREENSHOT
    hyprshot -m region --freeze -o "$BASE_SCREENSHOT_DIR/Region"
    ;;
  "$options_ss_window")
    sleep $SLEEP_BEFORE_SCREENSHOT
    hyprshot -m window --freeze -o "$BASE_SCREENSHOT_DIR/Window"
    ;;
  "$options_ss_monitor")
    sleep $SLEEP_BEFORE_SCREENSHOT
    hyprshot -m output --freeze -o "$BASE_SCREENSHOT_DIR/Monitor"
    ;;
  "$options_ss_region_clipboard")
    sleep $SLEEP_BEFORE_SCREENSHOT
    hyprshot -m region --freeze --clipboard-only 
    ;;
  "$options_ss_window_clipboard")
    sleep $SLEEP_BEFORE_SCREENSHOT
    hyprshot -m window --freeze --clipboard-only 
    ;;
  "$options_ss_monitor_clipboard")
    sleep $SLEEP_BEFORE_SCREENSHOT
    hyprshot -m output --freeze --clipboard-only
    ;;
  "$options_hyprland_toogle_pin")
    sleep 1.2
    result=$(hyprctl dispatch pin active)
    if [ $result == ok ]; then
      hyprctl notify 5 10000 "rgb(ff0000)" "fontsize:20 Floating Window [Un]Pinned"
    else
      hyprctl notify 0 10000 "rgb(ff0000)" "fontsize:20 $result"
    fi
    ;;
  =*)
    problem=$(strip_equals $selected)
    calculator "$problem"
    ;;
  *)
    echo "sowwy, unkown command: |$selected|"| wofi --dmenu
    ;;
esac