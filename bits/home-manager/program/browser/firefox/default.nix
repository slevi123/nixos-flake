{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    firefox
    firefoxpwa
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };
}
