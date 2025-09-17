{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.nix-output-monitor
  ];
}