{pkgs, ...}: {
  home.packages = with pkgs;
    [
      firefox
      vivaldi

      spotify
      arduino-ide
      insomnia
      fastfetch

      jq
      comma
      helvum # vs qpwgraph
      cava

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

      hyprpanel
      swaynotificationcenter
      # copyq
      clipse
      wl-clipboard
      socat
    ]
    ++ (with pkgs.jetbrains; [
      pycharm-professional
      idea-ultimate
      clion
    ])
    ++ (with pkgs.gnomeExtensions; [
      emoji-copy
      clipboard-history
      astra-monitor
      media-controls
      blur-my-shell
      burn-my-windows
      autohide-battery
      # caffeine
      # bubblemail
      xwayland-indicator

      # gnomeExtensions.noannoyance-2

      # system-monitor

      # pop-shell  # buggy, shortcuts not working
      # forge

      # gnomeExtensions.gsconnect  # not working
      # switcher # I got ulauncher

      # power-profile-switcher
      # power-profile-indicator  # not compatible

      # ideapad
      # ideapad-controls # may try in future

      # auto-cpufreq # not installing
      # cpufreq
    ])
    ++ [
      (let
        base = pkgs.appimageTools.defaultFhsEnvArgs;
      in
        pkgs.buildFHSUserEnv (base
          // {
            name = "fhs";
            targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [pkgs.pkg-config];
            profile = "export FHS=1";
            runScript = "zsh";
            # extraOutputsToInstall = ["dev"];
          }))
    ];
}
