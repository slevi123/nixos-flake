{ inputs, pkgs, ... }:
{
  # "github:youwen5/zen-browser-flake"
  home.packages = [
    inputs.zen-browser.packages."${pkgs.system}".default
  ];
}
