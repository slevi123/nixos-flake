{
  system.stateVersion = "25.05";
  # hostName = "HyPo";
  boot.loader.grub.efiSupport = false;
  boot.loader.grub.useOSProber = false;
  programs.nh.flake = "/my_own_nixos/nixos-flake";
}
