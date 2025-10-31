{ self, ezModules, ... }:
{
  imports = [
    ./charisma.nix
    ezModules.comfy

    "${self}/hardware/hp-elitebook-folio-9470m"
    "${self}/hosts/parts/charm-de.nix"
    # inputs.home-manager.nixosModules.home-manager

    "${self}/bits/nixos/users/groups.nix"
    "${self}/bits/nixos/users/leswellhm.nix"
    "${self}/bits/nixos/kvm/lan-mouse"
  ];
}
