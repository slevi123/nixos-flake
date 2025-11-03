{
  inputs,
  pkgs,
  charmpkgs,
  ...
}:
let
  inputs' = charmpkgs.lib.bring-system-inputs pkgs.system inputs;
in
{
  home.packages = [ inputs'.quickshell.packages.default ];
}
