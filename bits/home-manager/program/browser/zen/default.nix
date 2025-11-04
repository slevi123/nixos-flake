{
  inputs,
  pkgs,
  charmpkgs,
  ...
}:
let
  inputs' = charmpkgs.lib.bring-system-inputs pkgs.stdenv.hostPlatform.system inputs;
in
{
  # "github:youwen5/zen-browser-flake"
  home.packages = [ inputs'.zen-browser.packages.default ];
}
