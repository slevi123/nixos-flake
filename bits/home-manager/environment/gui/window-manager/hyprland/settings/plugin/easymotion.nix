{ inputs, pkgs, self, ... }:
let
  inputs' = (import "${self}/charmpkgs/lib/bring-system-inputs.nix" pkgs.system inputs);

in
{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [ "ALT, SPACE, easymotion, action:hyprctl dispatch focuswindow address:{}" ];
    };

    plugins = [ inputs'.hyprland-easymotion.packages.default ];
  };
}
