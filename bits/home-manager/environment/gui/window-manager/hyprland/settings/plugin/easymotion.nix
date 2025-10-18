{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "ALT, SPACE, easymotion, action:hyprctl dispatch focuswindow address:{}"
      ];
    };

    plugins = [
      inputs.hyprland-easymotion.packages.${pkgs.system}.default
    ];
  };
}
