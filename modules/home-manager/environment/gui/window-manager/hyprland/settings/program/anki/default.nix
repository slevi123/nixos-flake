{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, B, exec, kitty --title 'bluetuith' bluetuith  # Bluetooth settings"
    ];
    windowrulev2 = [
      "float, class:anki"
      "maxsize 90% 90%, class:anki"
    ];
  };
}