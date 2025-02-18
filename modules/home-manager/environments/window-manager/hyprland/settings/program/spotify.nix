{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, S, togglespecialworkspace, spotify"
      "SUPER, S, exec, spotify"
    ];

    windowrulev2 = [
      "workspace special:spotify, class:spotify"
    ];
  };
}