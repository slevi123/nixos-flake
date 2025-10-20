{ inputs }:
system:
let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in
{
  # makeGoogleFont = import ./google-font.nix pkgs;
  inherit (pkgs) hello;
}
