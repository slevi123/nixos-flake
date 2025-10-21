{ pkgs, ... }:
# let
#   pkgs-stable = inputs.nixpkgs-stable.legacyPackages."${pkgs.system}";
# in
{
  home.packages = with pkgs.jetbrains; [
    pycharm-professional
    idea-ultimate
    clion
  ];
}
