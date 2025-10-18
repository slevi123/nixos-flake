{ self, ... }:
{
  imports = [
    ./essential.nix
    "${self}/bitss/nixos/environment/tty/comphy.nix"
  ];
}
