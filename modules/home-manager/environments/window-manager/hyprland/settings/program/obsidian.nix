{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, O, togglespecialworkspace, obsidian   # Open obsidian in it's special workspace"
      "SUPER, O, exec, obsidian \"obsidian://open?vault=Notes\""
    ];

    windowrulev2 = [
      "workspace special:obsidian, class:obsidian"
    ];
  };
}
