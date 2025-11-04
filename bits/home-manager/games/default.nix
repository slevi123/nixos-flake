{
  pkgs,
  charmpkgs,
  inputs,
  ...
}:
let
  inputs' = charmpkgs.lib.bring-system-inputs pkgs.stdenv.hostPlatform.system inputs;

in
{
  home.packages = [
    inputs'.legacyPackages.steam-run
    # inputs'.nixpkgs-stable-unfree.legacyPackages.steam
  ];
}
