{ pkgs, ... }:
{
  home.packages = [
    pkgs.nixfmt
    pkgs.nixfmt-tree # formatter for folders
    pkgs.nil # linter
  ];
}
