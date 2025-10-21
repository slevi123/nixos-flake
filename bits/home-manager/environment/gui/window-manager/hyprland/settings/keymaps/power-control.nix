_: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER SHIFT, M, exec, systemctl suspend  # Sleep (suspend) system"
      "SUPER, M, exec, uwsm stop  # Exit session"
    ];
  };
}
