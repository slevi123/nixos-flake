# { inputs, pkgs, ... }:
# let
#   version = "1.2.0";
# in
# inputs.naersk.buildPackage {
#    src = pkgs.fetchFromGitHub {
#     owner = "Laeri";
#     repo = "powernotd";
#     rev = "v${version}";
#     sha256 = "sha256-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=";
#   };
# }

{
  pkgs ? import <nixpkgs> { },
}:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "powernotd";
  version = "1.2.0";

  src = pkgs.fetchFromGitHub {
    owner = "Laeri";
    repo = "powernotd";
    rev = "v${version}";
    sha256 = "sha256-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=";
  };

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };
}
