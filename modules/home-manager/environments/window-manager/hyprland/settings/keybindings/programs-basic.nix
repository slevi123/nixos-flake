{...}:
{
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$menu" = "ulauncher-toggle";
    bind = [
      "SUPER, Q, exec, $terminal"
      "SUPER, C, killactive,"
      "SUPER, M, exec, uwsm stop"
      "SUPER, f, fullscreen"
      "SUPER SHIFT, f, togglefloating,"
      "SUPER, R, exec, $menu"

      "SUPER SHIFT, B, exec, ~/.config/waybar/launch.sh" # Reload waybar
      "SUPER CTRL, B, exec, ~/.config/waybar/toggle.sh" # Toggle waybar
      "SUPER, L, exec, hyprlock"
      "SUPER, Space, exec, ~/.charm/scripts/hyprland/switch-lang.sh"
      "SUPER, B, exec, ~/.charm/scripts/hyprland/toggle-hyprsunset.sh"
    ];
  };
}
