{ inputs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [
      # pkgs.hyprlandPlugins.hyprexpo
    ];
  };
}
