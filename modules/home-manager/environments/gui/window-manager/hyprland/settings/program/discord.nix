{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, D, togglespecialworkspace, discord  # Open discord in it's special workspace"
      "SUPER, D, exec, discord"
    ];

    windowrulev2 = [
      "workspace special:discord, class:discord"
    ];
  };
}
