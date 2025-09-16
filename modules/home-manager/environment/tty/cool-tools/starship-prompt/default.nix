{ self, pkgs, ... }:
{
  programs = {
    starship = {
      enable = true;
      settings = pkgs.lib.importTOML ./dotfiles/starship.toml;
    };
  };
}
