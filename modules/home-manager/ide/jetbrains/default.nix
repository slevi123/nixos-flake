{pkgs, inputs, ...}:
let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages."${pkgs.system}";
in
{
  home.packages = with pkgs-stable.jetbrains; [
    pycharm-professional
    idea-ultimate
    clion
  ];
}