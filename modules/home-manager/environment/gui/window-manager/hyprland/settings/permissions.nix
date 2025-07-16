{...}:
{
  wayland.windowManager.hyprland.settings = {
    ecosystem = {
      enforce_permissions = true;
    };
    permission = [
      "hyprctl, plugin, allow"
    ];
  };
}