{ self, pkgs, ... }:
{
  imports = [
    ./essential.nix

    # file manager
    # superfile

    "${self}/bits/nixos/environment/tty/comphy.nix"
  ];

  environment.systemPackages = [ self.packages.${pkgs.system}.nixvim ];
}
