{ self, ... }:
{
  imports = [
    ./essential.nix
    "${self}/bits/nixos/environment/tty/comphy.nix"
  ];
}
