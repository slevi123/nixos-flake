_: {
  wayland.windowManager.hyprland.settings = {
    bind = [ "SUPER, B, exec, uwsm app -- kitty --title 'bluetuith' bluetuith  # Bluetooth settings" ];
    windowrulev2 = [
      "float, title:bluetuith"
      "stayfocused, title:bluetuith"
      "size 80% 75%, title:bluetuith"
      "center 1, title:bluetuith"
      "dimaround on, title:bluetuith"
      "bordersize 1, title:bluetuith"
      # "size <90 <80, title:bluetuith"
    ];
  };
}
