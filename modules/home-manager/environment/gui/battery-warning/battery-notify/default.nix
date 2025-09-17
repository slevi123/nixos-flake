{ pkgs, ... }:
{
  home.packages = [
    pkgs.battery-notify
  ];

  home.file.".config/battery-notify" = {
    source = ./dotfiles;
    recursive = true;
  };
}