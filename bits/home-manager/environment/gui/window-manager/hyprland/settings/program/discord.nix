_: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, D, togglespecialworkspace, discord  # Open discord in it's special workspace"
      "SUPER, D, exec, uwsm app discord"
    ];

    windowrulev2 = [ "workspace special:discord, class:discord" ];
  };
}
