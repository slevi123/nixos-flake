{ pkgs, ... }:
{
  imports = [
    ./groups.nix
    ./leswell.nix
    ./leswellhm.nix
    # ./unsafe.nix
  ];

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
    };
  };
}
