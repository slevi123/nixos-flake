{
  pkgs,
  inputs,
  self,
  ...
}:
let
  inputs' = import "${self}/charmpkgs/lib/bring-system-inputs.nix" pkgs.system inputs;
in
{
  home.packages = [ inputs'.packages.battery-notify ];

  home.file.".config/battery-notify" = {
    source = ./dotfiles;
    recursive = true;
  };
}
