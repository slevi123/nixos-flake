{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    plugins = with pkgs; {
      time-travel = yaziPlugins.time-travel; # zsh see history
      starship = yaziPlugins.starship;
      ouch = yaziPlugins.ouch; # compression previews using ouch
    };
  };
}