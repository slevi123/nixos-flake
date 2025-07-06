#!/usr/bin/env bash

options_volume_up="󰝝 Volume Up"
options_volume_down="󰝞 Volume Down"
options_volume_mute="󰝟 Mute"
# options_volume_play_pause=" Play/Pause"

# options_player_next=" Play/Pause"
# options_volume_play_pause=" Play/Pause"
# options_volume_play_pause=" Play/Pause"

options="\
$options_volume_up\n\
$options_volume_down\n\
$options_volume_mute\
"

selected=$(echo -e $options | wofi --dmenu --prompt="Quick Menu" --lines --width=75% )

case $selected in
  $options_volume_up)
    volumectl -u up
    $0
  ;;
  $options_volume_down)
    volumectl -u down
    $0
  ;;
  $options_volume_mute)
    volumectl toggle-mute
  ;;
  # $options_volume_play_pause)
  #   playerctl play-pause


  #       ", XF86AudioNext, exec, playerctl next"
  #     ", XF86AudioPlay, exec, playerctl play-pause"
  #     ", XF86AudioPrev, exec, playerctl previous"
  #     ", XF86AudioStop, exec, playerctl stop"
  # ;;

esac