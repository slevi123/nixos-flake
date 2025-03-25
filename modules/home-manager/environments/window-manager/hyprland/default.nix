{pkgs, inputs, lib, osConfig,  ...}: 
{
  imports = [
    ./settings
    # inputs.hyprland.homeManagerModules.default

  ];

  home.file.".charm/scripts/hyprland" = lib.mkIf osConfig.programs.hyprland.enable {
    source = ./scripts;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
