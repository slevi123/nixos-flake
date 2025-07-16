{lib, ...}:
{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1,defaultName:1"
      "2,defaultName:2"
      "3,defaultName:3"
      "4,defaultName:4"
      "5,defaultName:5"
      "6,defaultName:6"
      "7,defaultName:7"
      "8,defaultName:8"
      "9,defaultName:9"
      "10,defaultName:0"
      "11,defaultName:KP-1"
      "12,defaultName:KP-2"
      "13,defaultName:KP-3"
      "14,defaultName:KP-4"
      "15,defaultName:KP-5"
      "16,defaultName:KP-6"
      "17,defaultName:KP-7"
      "18,defaultName:KP-8"
      "19,defaultName:KP-9"
      "20,defaultName:KP-0"
    ];

    bind = let 
      dupList = map (num: [num num]);
    in
    builtins.concatMap 
    ( 
     workspace:
      let
        workspace_key = lib.head workspace;
        workspace_name = lib.elemAt workspace 1;
      in 
      [
        # Switch workspaces with mainMod + [0-9]
        "SUPER, ${workspace_key}, workspace, name:${workspace_name}"
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "SUPER SHIFT, ${workspace_key}, movetoworkspace, name:${workspace_name}"
        # Move active window to a workspace (without workspace switch) with mainMod + CTRL + SHIFT + [0-9]
        "SUPER CTRL SHIFT, ${workspace_key}, movetoworkspacesilent, name:${workspace_name}"

        "SUPER CTRL SHIFT, ${workspace_key}, movetoworkspacesilent, name:${workspace_name}"  
      ]
    ) 
    (
      (dupList ["1" "2" "3" "4" "5" "6" "7" "8" "9" "0"]) 
      ++ 
      [
        ["KP_End" "KP-1" ]
        ["KP_Down" "KP-2" ]
        ["KP_Next" "KP-3" ]
        ["KP_Left" "KP-4" ]
        ["KP_Begin" "KP-5" ]
        ["KP_Right" "KP-6" ]
        ["KP_Home" "KP-7" ]
        ["KP_Up" "KP-8"]
        ["KP_Prior" "KP-9"]
        ["KP_Insert" "KP-0"]
      ]
    ) 
    ++ 
    [

      # Move focus with mainMod + arrow keys
      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

      # Move workspace to monitor with mainMod + CTRL + arrow keys
      "CTRL SUPER, left, movecurrentworkspacetomonitor, l"
      "CTRL SUPER, right, movecurrentworkspacetomonitor, r"
      "CTRL SUPER, up, movecurrentworkspacetomonitor, u"
      "CTRL SUPER, down, movecurrentworkspacetomonitor, d"

      # Move current window with mainMod + SHIFT + arrow keys
      "SHIFT SUPER, right, movewindow, r"
      "SHIFT SUPER, left, movewindow, l"
      "SHIFT SUPER, up, movewindow, u"
      "SHIFT SUPER, down, movewindow, d"
    ];
  };
}


# =======================================
# source: https://www.reddit.com/r/hyprland/comments/11zy9tj/binding_numpad_keys_to_switch_workspaces/
#  bind = SUPER, KP_End, workspace, 1

# bind = SUPER, KP_Down, workspace, 2

# bind = SUPER, KP_Next, workspace, 3

# bind = SUPER, KP_Left, workspace, 4

# bind = SUPER, KP_Begin, workspace, 5

# bind = SUPER, KP_Right, workspace, 6

# bind = SUPER, KP_Home, workspace, 7

# bind = SUPER, KP_Up, workspace, 8

# bind = SUPER, KP_Prior, workspace, 9

# bind = SUPER, KP_Insert, workspace, 10 
