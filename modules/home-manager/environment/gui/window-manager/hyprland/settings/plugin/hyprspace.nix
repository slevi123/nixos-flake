{inputs, pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    settings = {
      bind = [
        "SUPER, tab, overview:toggle" # can be: toggle, off/disable or on/enable
        
      ];
    };
  };
}