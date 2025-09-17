{ ... }: {
  # CLI helper for nix
  programs.nh = {
    enable = true;
    flake = "/nix_config/my_own_nix_config";
    # clean.enable = true;
    # clean.extraArgs = "--keep-since 4d --keep 3";
  };
}