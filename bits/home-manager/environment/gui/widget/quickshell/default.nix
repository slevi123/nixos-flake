{ pkgs, inputs', ... }:
{
  home.packages = [ inputs'.quickshell.packages.default ];
}
