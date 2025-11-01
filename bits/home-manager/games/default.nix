{
  pkgs,
  self,
  inputs,
  ...
}:
let
  inputs' = import "${self}/charmpkgs/lib/bring-system-inputs.nix" pkgs.system inputs;
in
{
  home.packages = [
    inputs'.legacyPackages.steam-run
    # inputs'.nixpkgs-stable-unfree.legacyPackages.steam
  ];
}
