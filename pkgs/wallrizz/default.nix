{ pkgs, stdenv, ... }:
stdenv.mkDerivation {
  pname = "wallrizz";
  version = "v1.3.0";
  src = pkgs.fetchzip {
    url = "https://github.com/5hubham5ingh/WallRizz/releases/download/v1.3.0/WallRizz-linux-86_64.tar.gz";
    # hash = lib.fakeHash;
    hash = "sha256-C+hXWMh9KrFDOdSyNvE16cE8sQECrL/oIAzeNSvqanU=";
    executable = true;
  };

  propagatedBuildInputs = [
    pkgs.imagemagick
    # somehow add ${pkgs.imagemagic}/lib to LD_LIBRARY_PATH for this package, maybe a wrapper
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp WallRizz $out/bin/
  '';
}
