# { inputs, pkgs, ... }:
# let
#   version = "0.3.5";
# in
# inputs.naersk.buildPackage {
#    src = pkgs.fetchFromGitHub {
#     owner = "cdown";
#     repo = "battery-notify";
#     rev = "v${version}";
#     sha256 = "sha256-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=";
#   };
# }
{
  pkgs ? import <nixpkgs> { },
}:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "battery-notify";
  version = "0.3.5";

  src = pkgs.fetchFromGitHub {
    owner = "cdown";
    repo = "battery-notify";
    rev = "${version}";
    sha256 = "sha256-ElNKEr7v26vlzPwC97RStUSc9MVSe4epxunjfVjVfCE=";
  };

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };
}
