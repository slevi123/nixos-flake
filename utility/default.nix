{ moduleWithSystem, ... }:
{
  flake.utils = moduleWithSystem (
    _perSystem@{ pkgs, ... }:  # NOTE: only explicitly named parameters will be in perSystem; see below
    _nixos@{ ... }: {
    # makeGoogleFont = import ./google-font.nix pkgs;
    inherit (pkgs) hello;
  }
  );
}
