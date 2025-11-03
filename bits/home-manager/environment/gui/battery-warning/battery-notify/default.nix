{ pkgs, self, charmpkgs, ... }:
let
  # inputs' = import "${self}/charmpkgs/lib/bring-system-inputs.nix" pkgs.system inputs;
  self' = charmpkgs.lib.bring-system pkgs.system self;
in
{
  home.packages = [ self'.packages.battery-notify ];

  home.file.".config/battery-notify" = {
    source = ./dotfiles;
    recursive = true;
  };
}
