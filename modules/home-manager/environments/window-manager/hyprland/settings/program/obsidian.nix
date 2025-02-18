{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, O, togglespecialworkspace, obsidian"
      "SUPER, O, exec, obsidian \"obsidian://open?vault=Notes\""
    ];

    windowrulev2 = [
      "workspace special:obsidian, class:obsidian"
    ];
  };
}