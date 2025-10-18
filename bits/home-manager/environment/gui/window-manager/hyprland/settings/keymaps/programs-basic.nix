{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    # "$menu" = "ulauncher-toggle";
    bind = [
      "SUPER, Q, exec, uwsm app -- $terminal"
      "SUPER, Z, exec, uwsm app zen"
      "SUPER, C, killactive,"
      "SUPER, M, exec, uwsm stop"
      "SUPER, f, fullscreen"
      "SUPER SHIFT, f, togglefloating,"
      # "SUPER, R, exec, wofi --show=drun --height=70% --width=40%"
      "SUPER, R, exec, uwsm app -- rofi -show drun -show-icons -run-command 'uwsm app -- {cmd}'"

      "SUPER SHIFT, W, exec, uwsm app ~/.config/waybar/launch.sh # Reload waybar"
      "SUPER CTRL, W, exec, uwsm app ~/.config/waybar/toggle.sh # Toggle waybar"
      "SUPER SHIFT, A, exec, uwsm app ~/.config/ashell/toggle.sh # Toggle ashell"
      "SUPER, L, exec, uwsm app hyprlock"
      "SUPER, Space, exec, uwsm app ~/.charm/scripts/hyprland/switch-lang.sh # Switch language"
      "SUPER SHIFT, B, exec, uwsm app ~/.charm/scripts/hyprland/toggle-hyprsunset.sh # Toggle bluelight (hyprsunset)"
      "SUPER, T, exec, uwsm app kitten quick-access-terminal"
    ];

    bindd = [
      "SUPER, P, Opens up quick-actions menu, exec, uwsm app quick-actions"
    ];
  };
}
