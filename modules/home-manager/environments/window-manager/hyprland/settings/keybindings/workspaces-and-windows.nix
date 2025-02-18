{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Switch workspaces with mainMod + [0-9]
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER SHIFT, 0, movetoworkspace, 10"

      # Move active window to a workspace (without workspace switch) with mainMod + CTRL + SHIFT + [0-9]
      "SUPER CTRL SHIFT, 1, movetoworkspacesilent, 1"
      "SUPER CTRL SHIFT, 2, movetoworkspacesilent, 2"
      "SUPER CTRL SHIFT, 3, movetoworkspacesilent, 3"
      "SUPER CTRL SHIFT, 4, movetoworkspacesilent, 4"
      "SUPER CTRL SHIFT, 5, movetoworkspacesilent, 5"
      "SUPER CTRL SHIFT, 6, movetoworkspacesilent, 6"
      "SUPER CTRL SHIFT, 7, movetoworkspacesilent, 7"
      "SUPER CTRL SHIFT, 8, movetoworkspacesilent, 8"
      "SUPER CTRL SHIFT, 9, movetoworkspacesilent, 9"
      "SUPER CTRL SHIFT, 0, movetoworkspacesilent, 10"

      # Move focus with mainMod + arrow keys
      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

      # Move workspace to monitor with mainMod + CTRL + arrow keys
      "CTRL SUPER, left, movecurrentworkspacetomonitor, l"
      "CTRL SUPER, right, movecurrentworkspacetomonitor, r"

      # Move current window with mainMod + SHIFT + arrow keys
      "SHIFT SUPER, right, movewindow, r"
      "SHIFT SUPER, left, movewindow, l"
    ];
  };
}