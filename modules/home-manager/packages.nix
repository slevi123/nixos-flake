{pkgs, ...}: {
  home.packages = with pkgs;
    [
      wtype

      firefox
      # vivaldi

      spotify
      arduino-ide
      insomnia
      fastfetch

      jq
      comma
      helvum # vs qpwgraph
      cava

      delta

      # hypr
      psmisc
      pywal16
      rofi
      hyprshade
      bluez
      bluetuith
      bluetui
      hyprpolkitagent
      hyprpaper
      hypridle
      hyprsunset
      hyprcursor
      hyprpicker
      hyprlang
      hyprshot
      brightnessctl
      playerctl
      udiskie
      overskride # bluetooth GUI
      # libsForQt5.xwaylandvideobridge # have to try it out
      # iwgtk # I use NetworkManagar not iwd
      networkmanagerapplet # WIFI needs gnome theme, it's good, until I get better
      avizo # notifications for light and volumctl

      swaynotificationcenter
      # copyq
      clipse
      wl-clipboard
      socat

      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      nerd-fonts.code-new-roman
    ]
    ++ (with pkgs.jetbrains; [
      pycharm-professional
      idea-ultimate
      clion
    ])
    ++ [
      (let
        base = pkgs.appimageTools.defaultFhsEnvArgs;
      in
        pkgs.buildFHSEnv (base
          // {
            name = "fhs";
            targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [pkgs.pkg-config];
            profile = "export FHS=1";
            runScript = "zsh";
            # extraOutputsToInstall = ["dev"];
          }))
    ];
}
