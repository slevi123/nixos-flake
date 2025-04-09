{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, B, exec, kitty --title 'bluetuith' bluetuith  # Bluetooth settings"
    ];
    windowrulev2 = [
      "float, title:bluetuith"
    ];
  };
}