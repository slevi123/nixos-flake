{inputs, pkgs, ... }:
{
  home.packages = [
    inputs.molten-ui.packages.${pkgs.stdenv.hostPlatform.system}.firemenu
  ];
}
