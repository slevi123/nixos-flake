{ pkgs, ... }:
{
  home.packages = [
    pkgs.steam-run
    # inputs.nixpkgs-stable-unfree.legacyPackages.${pkgs.system}.steam
  ];
}
