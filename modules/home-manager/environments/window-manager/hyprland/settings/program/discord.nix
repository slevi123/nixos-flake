{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, D, togglespecialworkspace, discord"
      "SUPER        , D, exec, discord"
    ];

    windowrulev2 = [
      "workspace special:discord, class:discord"
    ];
  };
}
