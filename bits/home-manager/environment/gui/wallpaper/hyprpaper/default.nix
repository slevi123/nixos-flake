{
  charmpkgs,
  inputs,
  pkgs,
  ...
}:
let
  inputs' = charmpkgs.lib.bring-system-inputs pkgs.system inputs;
in
{
  home.file.".config/hypr/hyprpaper.conf" = {
    text = import ./config.nix {
      inherit charmpkgs;
      inherit (inputs'.media.packages) wallpaper;
    };
  };

  home.sessionVariables = {
    CHARM_WALLPAPER = "hyprpaper";
  };
}
