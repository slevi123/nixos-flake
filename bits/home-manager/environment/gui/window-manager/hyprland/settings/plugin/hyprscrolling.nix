{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [
      # inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
      pkgs.hyprlandPlugins.hyprscrolling
    ];

    settings = {
      plugin.hyprscrolling = {

      };
    };

    extraConfig = ''
      bind = SUPER, KP_Divide, submap, scroll-map
      bind = SUPER, KP_Divide, exec, hyprctl keyword general:layout "scrolling"
      submap = scroll-map

      # Scroll operations
      bind = SUPER, left, layoutmsg, move -col
      bind = SUPER, right, layoutmsg, move +col

      bind = SHIFT SUPER, right, layoutmsg, movewindowto r
      bind = SHIFT SUPER, left, layoutmsg, movewindowto l

      bind = SUPER, left, layoutmsg, focus l
      bind = SUPER, right, layoutmsg, focus r
      bind = SUPER, up, layoutmsg, focus u
      bind = SUPER, down, layoutmsg, focus d

      bind = , escape, submap, reset
      bind = , excape, exec, hyprctl keyword general:layout "master"
      submap = reset
    '';
  };
}
