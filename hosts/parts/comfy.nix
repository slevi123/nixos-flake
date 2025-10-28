{ self, self', ... }:
{
  imports = [
    ./essential.nix

    # file manager
    # superfile

    "${self}/bits/nixos/environment/tty/comphy.nix"
    "${self}/bits/nixos/environment/remote/ssh"
    "${self}/bits/nixos/bootloader/plymouth"
  ];

  environment.systemPackages = [ self'.packages.nixvim ];
}
