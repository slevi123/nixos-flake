#!/bin/sh

handle() {
  case $1 in
    activewindow*) pkill -35 waybar;;
    # monitoradded*) do_something ;;
    # focusedmon*) do_something_else ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done