{...}:
{
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    # "$menu" = "ulauncher-toggle";
    bind = [
      "SUPER, Q, exec, $terminal"
      "SUPER, Z, exec, zen"
      "SUPER, C, killactive,"
      "SUPER, M, exec, uwsm stop"
      "SUPER, f, fullscreen"
      "SUPER SHIFT, f, togglefloating,"
      # "SUPER, R, exec, wofi --show=drun --height=70% --width=40%"
      "SUPER, R, exec, rofi -show drun -show-icons"

      "SUPER SHIFT, W, exec, ~/.config/waybar/launch.sh # Reload waybar"
      "SUPER CTRL, W, exec, ~/.config/waybar/toggle.sh # Toggle waybar"
      "SUPER SHIFT, A, exec, ~/.config/ashell/toggle.sh # Toggle ashell"
      "SUPER, L, exec, hyprlock"
      "SUPER, Space, exec, ~/.charm/scripts/hyprland/switch-lang.sh # Switch language"
      "SUPER SHIFT, B, exec, ~/.charm/scripts/hyprland/toggle-hyprsunset.sh # Toggle bluelight (hyprsunset)"
      "SUPER, T, exec, kitten quick-access-terminal"
    ];

    bindd = [
      "SUPER, P, Opens up quick-actions menu, exec, quick-actions"
    ];
  };
}