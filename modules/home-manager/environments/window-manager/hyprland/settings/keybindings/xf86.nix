{...}:
{
  wayland.windowManager.hyprland = {
    bindel = [
      ",XF86AudioRaiseVolume, exec, volumectl -u up"
      ",XF86AudioLowerVolume, exec, volumectl -u down"
      ",XF86AudioMute, exec, volumectl toggle-mute"
      ",XF86AudioMicMute, exec, volumectl -m toggle-mute"
      ",XF86MonBrightnessUp, exec, lightctl up"
      ",XF86MonBrightnessDown, exec, lightctl down"
    ];

    bindl = [
      # Requires playerctl
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioStop, exec, playerctl stop"
    ];
  };
}