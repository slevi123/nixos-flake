{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    plugins = with pkgs; {
      inherit (yaziPlugins) time-travel; # zsh see history
      inherit (yaziPlugins) starship;
      inherit (yaziPlugins) ouch; # compression previews using ouch
    };
  };
}
