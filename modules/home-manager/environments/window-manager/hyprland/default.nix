{pkgs, lib, osConfig,  ...}: 
{
  imports = [
    ./settings
  ];

  home.file.".charm/scripts/hyprland" = lib.mkIf osConfig.programs.hyprland.enable {
    source = ./scripts;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      pkgs.hyprlandPlugins.hyprexpo
    ];
  };
}
