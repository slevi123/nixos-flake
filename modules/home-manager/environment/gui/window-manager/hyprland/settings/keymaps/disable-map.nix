{ ... }:
# let
#   keys = [
#     "A" "B" "C" "D" "E" "F" "G" "H" "I" "J"
#     "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T"
#     "U" "V" "W" "X" "Y" "Z"
#     "0" "1" "2" "3" "4" "5" "6" "7" "8" "9"
#     "ESCAPE" "SPACE" "TAB" "ENTER"
#     "UP" "DOWN" "LEFT" "RIGHT"
#     "KP_End"
#     "KP_Down"
#     "KP_Next"
#     "KP_Left"
#     "KP_Begin"
#     "KP_Right"
#     "KP_Home"
#     "KP_Up"
#     "KP_Prior"
#     "KP_Insert"
#   ];
#   blockedBinds = builtins.concatStringsSep "\n"
#     (map (k: "bindp = , ${k}, nop") keys);
# in
{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      bind = SUPER, escape, submap, disable
      submap = disable
      
      bind = SUPER, escape, submap, reset
      bindip = SUPER, catchall, execr

      submap = reset
    '';
  };
}
