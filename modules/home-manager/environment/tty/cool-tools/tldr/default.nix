{pkgs, ...}:
{
  programs.tealdeer = {
    # tealdeer is faster than tldr
    enable = true;
    enableAutoUpdates = true;

    settings = pkgs.lib.importTOML ./dotfiles/config.toml;
  };
}