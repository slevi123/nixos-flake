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
  home.packages = with pkgs; [ inputs'.nixpkgs-stable-unfree.legacyPackages.discord ];
}
