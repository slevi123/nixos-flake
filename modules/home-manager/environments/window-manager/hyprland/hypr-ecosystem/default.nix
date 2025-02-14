{pkgs, lib, osConfig,  ...}: 
{
  home.file.".config/hypr" = lib.mkIf osConfig.programs.hyprland.enable {
    source = ./dotfiles/hypr;
    recursive = true;
  };
}