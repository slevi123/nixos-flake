{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [
      pkgs.hyprlandPlugins.hyprspace
    ];
    settings = {
      bind = [
        "SUPER, Tab, overview:toggle" # can be: toggle, off/disable or on/enable

      ];
    };
  };
}
