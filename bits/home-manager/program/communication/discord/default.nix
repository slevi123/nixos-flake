{
  pkgs,
  charmpkgs,
  inputs,
  ...
}:
let
  inputs' = charmpkgs.lib.bring-system-inputs pkgs.system inputs;
in
{
  home.packages = [ inputs'.nixpkgs-stable-unfree.legacyPackages.discord ];
}
