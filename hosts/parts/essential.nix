{ self, stateVersion, hostName, ... }:
{
  imports = [
    # Makes interacting with nix tooling HUMAN_FRIENDLY
    "${self}/bits/nixos/environment/nix/nh.nix"

    # Makes trying out programs easy
    "${self}/bits/nixos/environment/tty/cool-tools/comma"

    # A small IDE is essential for editing configuration 
    "${self}/bits/nixos/ide/helix"
  ];

  networking = {
    inherit hostName;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = stateVersion;
}
