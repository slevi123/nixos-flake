{ self, stateVersion, ... }:
{
  imports = [
    "${self}/modules/nixos/environment/nix/nh.nix"
    "${self}/modules/nixos/environment/tty/cool-tools/comma"
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = stateVersion;
}
