{ pkgs, inputs, ... }:
{
  home.file.".config/ashell" = {
    source = ./dotfiles;
    recursive = true;
  };

  home.packages = [ inputs.ashell.defaultPackage.${pkgs.system} ];
}
