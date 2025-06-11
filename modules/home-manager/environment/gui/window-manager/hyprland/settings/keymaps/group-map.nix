{...}:
{
  wayland.windowManager.hyprland = {
    settings = {};
      # https://wiki.hyprland.org/Configuring/Variables/#gestures

    extraConfig = ''
      bind = SUPER, G, submap, group-map
      submap = group-map

      # Group operations
      bind = , g, togglegroup
      bind = , n, changegroupactive, f
      bind = , p, changegroupactive, b
      bind = , l, lockactivegroup, toggle
      bind = , G, lockgroups, toggle
      bind = , d, denywindowfromgroup

      # Window movement with group awareness
      bind = , h, movewindoworgroup, l
      bind = , j, movewindoworgroup, d
      bind = , k, movewindoworgroup, u
      bind = , l, movewindoworgroup, r

      bind = , escape, submap, reset
      submap = reset
    '';
  };
}