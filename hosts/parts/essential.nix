{ self, stateVersion, ... }:
{
  imports = [
    "${self}/bitss/nixos/environment/nix/nh.nix"
    "${self}/bitss/nixos/environment/tty/cool-tools/comma"
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = stateVersion;
}
