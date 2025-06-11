{inputs, pkgs, ...}:
{
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    settings = {
      bind = [
        "SUPER, Tab, overview:toggle" # can be: toggle, off/disable or on/enable
        
      ];
    };
  };
}