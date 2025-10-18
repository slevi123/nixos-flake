{ pkgs, ... }:
{
  home.packages = [
    pkgs.swaynotificationcenter
  ];

  home.file.".config/swaync" = {
    source = ./dotfiles/swaync;
    recursive = true;
  };
}
