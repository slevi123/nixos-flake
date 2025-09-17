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
{ pkgs ? import <nixpkgs> {} }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "powernotd";
  version = "0.3.5";

  src = pkgs.fetchFromGitHub {
    owner = "cdown";
    repo = "battery-notify";
    rev = "v${version}";
    sha256 = "sha256-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=";
  };

  cargoSha256 = "sha256-bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb=";
}
