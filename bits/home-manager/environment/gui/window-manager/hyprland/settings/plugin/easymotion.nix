{
  inputs,
  pkgs,
  charmpkgs,
  ...
}:
let
  inputs' = charmpkgs.lib.bring-system-inputs pkgs.stdenv.hostPlatform.system inputs;
in
{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [ "ALT, SPACE, easymotion, action:hyprctl dispatch focuswindow address:{}" ];
    };

    plugins = [ inputs'.hyprland-easymotion.packages.default ];
  };
}
