_: {
  wayland.windowManager.hyprland.settings = {
    # https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
      disable_autoreload = true;
    };

    xwayland = {
      force_zero_scaling = true;
    };

    general = {
      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;
    };
  };
}
