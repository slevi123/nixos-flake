{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "SUPER SHIFT, , easymotion, action:hyprctl dispatch focuswindow address:{}"
      ];
    };

    plugins = [
      inputs.hyprland-easymotion.packages.${pkgs.system}.hyprland-easymotion
    ];
  };
}
