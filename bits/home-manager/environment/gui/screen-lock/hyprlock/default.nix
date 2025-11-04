{
  inputs,
  charmpkgs,
  pkgs,
  ...
}:
let
  inputs' = charmpkgs.lib.bring-system-inputs pkgs.stdenv.hostPlatform.system inputs;
in
{
  programs.hyprlock = {
    enable = true;
    settings = import ./settings.nix { inherit (inputs'.media.packages) wallpaper lockscreen; };
  };

  home.sessionVariables = {
    CHARM_SCREENLOCK = "hyprlock";
  };
}
