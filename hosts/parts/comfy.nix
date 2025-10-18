{ self, ... }:
{
  imports = [
    ./essential.nix
    "${self}/modules/nixos/environment/tty/comphy.nix"
  ];
}
