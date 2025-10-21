{ flake-path, ... }:
{
  # CLI helper for nix
  programs.nh = {
    enable = true;
    flake = flake-path;
    # clean.enable = true;
    # clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
