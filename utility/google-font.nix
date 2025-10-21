pkgs:
{
  font-name,
  sha256,
  version,
}:
pkgs.stdenv.mkDerivation {
  name = font-name;
  inherit version;
  src = pkgs.fetchurl {
    url = "https://fonts.googleapis.com/css2?family=${font-name}";
    inherit sha256;
    # sha256 = pkgs.lib.fakeHash;
  };

  installPhase = ''
    cp * $out/share
  '';
}
