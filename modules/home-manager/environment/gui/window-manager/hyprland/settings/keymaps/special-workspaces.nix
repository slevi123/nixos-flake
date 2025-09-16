{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      bind =
        builtins.concatMap
          (
            workspace:
            let
              workspace_key = lib.head workspace;
              workspace_name = lib.elemAt workspace 1;
            in
            [
              "SUPER ALT, ${workspace_key}, togglespecialworkspace, sp${workspace_name}"
              "SUPER CTRL, ${workspace_key}, movetoworkspace, special:sp${workspace_name}"
            ]
          )
          [
            [
              "KP_End"
              "KP-1"
            ]
            [
              "KP_Down"
              "KP-2"
            ]
            [
              "KP_Next"
              "KP-3"
            ]
            [
              "KP_Left"
              "KP-4"
            ]
            [
              "KP_Begin"
              "KP-5"
            ]
            [
              "KP_Right"
              "KP-6"
            ]
            [
              "KP_Home"
              "KP-7"
            ]
            [
              "KP_Up"
              "KP-8"
            ]
            [
              "KP_Prior"
              "KP-9"
            ]
            [
              "KP_Insert"
              "KP-0"
            ]
          ];

      # [
      #   # Move/resize windows with mainMod + LMB/RMB and dragging
      #   "SUPER ALT, 1, togglespecialworkspace, sp1"
      #   "SUPER ALT, 2, togglespecialworkspace, sp2"
      #   "SUPER ALT, 3, togglespecialworkspace, sp3"
      #   "SUPER ALT, 4, togglespecialworkspace, sp4"
      #   "SUPER ALT, 5, togglespecialworkspace, sp5"
      #   "SUPER ALT, 6, togglespecialworkspace, sp6"
      # ];
    };
    #   extraConfig = ''
    #     bind = SUPER ALT, W, submap, special-ws-maps
    #     submap = special-ws-maps

    #     bind = SUPER SHIFT, 1, movetoworkspace, special:sp1
    #     bind = SUPER SHIFT, 2, movetoworkspace, special:sp2
    #     bind = SUPER SHIFT, 3, movetoworkspace, special:sp3
    #     bind = SUPER SHIFT, 4, movetoworkspace, special:sp4
    #     bind = SUPER SHIFT, 5, movetoworkspace, special:sp5
    #     bind = SUPER SHIFT, 6, movetoworkspace, special:sp6

    #     bind = , escape, submap, reset
    #     submap = reset
    #   '';
  };
}
