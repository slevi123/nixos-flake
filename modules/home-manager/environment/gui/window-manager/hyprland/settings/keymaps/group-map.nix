{ ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      group.groupbar = {
        # stacked = true;
        # "col.active" = "0xfc0303";
        # "col.inactive" = "0x8a6565";
        # col.inactive = "0x2b0000";
        # text_color = "0x000000";
        # text_color_inactive = "";

        # "col.locked_active" = "0xf0f0f0";
        # "col.locked_inactive" = "0x000000";
        # text_color_locked_active = "0x000000";
        # text_color_locked_inactive = "0xf0f0f0";

        # indicator_gap = 2;
      };
    };
    # https://wiki.hyprland.org/Configuring/Variables/#gestures

    extraConfig = ''
      bind = SUPER ALT, right, changegroupactive, f
      bind = SUPER ALT, left, changegroupactive, b

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
      bind = , left, movewindoworgroup, l
      bind = , down, movewindoworgroup, d
      bind = , up, movewindoworgroup, u
      bind = , right, movewindoworgroup, r

      bind = SUPER ALT, up, moveintogroup, u
      bind = SUPER ALT, down, moveintogroup, d
      bind = SUPER ALT, left, moveintogroup, l
      bind = SUPER ALT, right, moveintogroup, r

      bindd = , escape, "exits the group-map", submap, reset
      submap = reset
    '';
  };
}
