{...}:
{
  wayland.windowManager.hyprland.settings = {
    ecosystem = {
      enforce_permissions = true;
    };
    permission = [
      "/nix/store/.*hyprland.*/bin/hyprctl, plugin, allow"
    ];
  };
}