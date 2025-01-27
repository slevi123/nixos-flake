{pkgs, ...} : {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1, preferred, 1920x0, 1"
      "HDMI-A-1, preferred, 0x0, 1"
    ];

    # "$mod" = "SUPER";
    # bind =
    #   [
    #     "$mod, F, exec, firefox"
    #     ", Print, exec, grimblast copy area"
    #   ]
    #   ++ (
    #     # workspaces
    #     # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
    #     builtins.concatLists (builtins.genList (i:
    #         let ws = i + 1;
    #         in [
    #           "$mod, code:1${toString i}, workspace, ${toString ws}"
    #           "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
    #         ]
    #       )
    #       9)
    #   );
  };
}