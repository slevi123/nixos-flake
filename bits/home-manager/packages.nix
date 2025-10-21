{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    [
      wtype

      # vivaldi

      spotify
      arduino-ide
      insomnia

      jq
      cava

      delta

      # hypr
      psmisc
      pywal16
      hyprshade
      hyprpolkitagent
      hyprpaper
      hypridle
      hyprsunset
      hyprcursor
      hyprpicker
      hyprlang
      brightnessctl
      playerctl
      udiskie
      # libsForQt5.xwaylandvideobridge # have to try it out
      # iwgtk # I use NetworkManager not iwd
      networkmanagerapplet # WIFI needs gnome theme, it's good, until I get better
      avizo # notifications for light and volumctl
      # copyq
      clipse
      wl-clipboard
      socat
    ]
    ++ [
      (
        let
          base = pkgs.appimageTools.defaultFhsEnvArgs;
        in
        pkgs.buildFHSEnv (
          base
          // {
            name = "fhs";
            targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [ pkgs.pkg-config ];
            profile = "export FHS=1";
            runScript = "zsh";
            # extraOutputsToInstall = ["dev"];
          }
        )
      )
    ];
}
