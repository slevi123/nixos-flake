{ inputs,pkgs, self,  ... }:
let
  inputs' = (import "${self}/charmpkgs/lib/bring-system-inputs.nix" pkgs.system inputs);
in
{
  # "github:youwen5/zen-browser-flake"
  home.packages = [ inputs'.zen-browser.packages.default ];
}
