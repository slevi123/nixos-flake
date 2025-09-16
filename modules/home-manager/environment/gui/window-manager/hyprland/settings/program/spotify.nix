{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, S, togglespecialworkspace, spotify"
      "SUPER, S, exec, spotify  # Open spotify in it's special workspace"
    ];

    windowrulev2 = [
      "workspace special:spotify, class:spotify"
    ];
  };
}
