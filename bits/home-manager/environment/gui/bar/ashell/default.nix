{ inputs, pkgs, ... }:
{
  home.file.".config/ashell" = {
    source = ./dotfiles;
    recursive = true;
  };

  # must use system [wrong format ...]
  home.packages = [ inputs.ashell.defaultPackage.${pkgs.stdenv.hostPlatform.system} ];
}
