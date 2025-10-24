{ inputs, pkgs, inputs', ... }:
{
  # "github:youwen5/zen-browser-flake"
  home.packages = [ inputs'.zen-browser.packages.default ];
}
