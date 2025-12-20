{
  system.stateVersion = "23.05";
  # networking.hostName = "leswell-nixos";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  programs.nh.flake = "/nix_config/my_own_nix_config";

  nix = {
    settings = {
      max-jobs = 3;
      cores = 4;
    };
  };
}
