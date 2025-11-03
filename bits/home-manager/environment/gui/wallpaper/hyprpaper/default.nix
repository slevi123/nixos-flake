{ charmpkgs, ... }:
let
  conf = charmpkgs.lib.build-hyprpaper-conf {
    preload = [
      "~/Pictures/wallpapers/blue.jpg"
      "~/Pictures/wallpapers/groot.jpg"
      "~/Pictures/wallpapers/sunnyhill.jpg"
    ];

    wallpaper = {
      eDP-1 = "~/Pictures/wallpapers/sunnyhill.jpg";
      HDMI-A-1 = "~/Pictures/wallpapers/groot.jpg";
    };

    #enable splash text rendering over the wallpaper
    splash = true;
  } "generated-hyprpaper.conf";
in
{
  home.file.".config/hypr/hyprpaper.conf" = {
    source = conf;
  };

  home.sessionVariables = {
    CHARM_WALLPAPER = "hyprpaper";
  };
}
