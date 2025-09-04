{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # "SUPER, A, exec, ~/.charm/scripts/hyprland/wofi/audio-changer.py  # Change default audio sink"
      # "SUPER, H, exec, ~/.charm/scripts/hyprland/wofi/cheatsheet.sh # Open binding cheatsheet"
      # "SUPER SHIFT, P, exec, ~/.charm/scripts/hyprland/wofi/power-menu # Open power menu"
    ];
    layerrule = [
      # "dimaround, rofi"
      "blur, rofi"
    ];
  };
}