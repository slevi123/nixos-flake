{ self, pkgs, charmpkgs, ... }:
let
  self' = charmpkgs.lib.bring-system pkgs.system self;
in
{
  imports = [
    # file manager
    # superfile

    "${self}/bits/nixos/environment/tty/comphy.nix"
    "${self}/bits/nixos/environment/remote/ssh"
    "${self}/bits/nixos/bootloader/plymouth"
  ];

  environment.systemPackages = [ self'.packages.nixvim ];
}
