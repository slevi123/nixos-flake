{ charmpkgs, wallpaper }:
let
  sunnyhill = "${wallpaper}/sunnyhill.jpg";
  groot = "${wallpaper}/groot.jpg";
in
charmpkgs.lib.build-hyprpaper-conf {
  preload = [
    "${wallpaper}/blue.jpg"
    sunnyhill
    groot
  ];

  wallpaper = {
    eDP-1 = sunnyhill;
    HDMI-A-1 = groot;
  };

  #enable splash text rendering over the wallpaper
  splash = true;
}
