{
  inputs,
  pkgs,
  self,
  ...
}:
let
  inputs' = import "${self}/charmpkgs/lib/bring-system-inputs.nix" pkgs.system inputs;
in
{
  home.packages = [ inputs'.quickshell.packages.default ];
}
