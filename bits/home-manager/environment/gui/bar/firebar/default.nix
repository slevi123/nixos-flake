{ inputs, pkgs, ... }:
{
  home.file.".config/firebar" = {
    source = ./scripts;
    recursive = true;
  };

  home.packages = [
    inputs.molten-ui.packages.${pkgs.stdenv.hostPlatform.system}.firebar
  ];
}
