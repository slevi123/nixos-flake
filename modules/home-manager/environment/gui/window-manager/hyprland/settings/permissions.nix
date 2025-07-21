{...}:
{
  wayland.windowManager.hyprland.settings = {
    ecosystem = {
      enforce_permissions = true;
    };
    permission = [
      "/nix/store/.*-hyprland-.*/bin/hyprctl, plugin, allow"
      "/nix/store/.*-hyprpicker-.*/bin/hyprpicker, screencopy, allow"
      "/nix/store/.*-hyprshot-.*/bin/hyprshot, screencopy, allow"
      "/nix/store/.*-grim-.*/bin/grim, screencopy, allow"
      # TODO: improve security by adding more concrete regexes
    ];
  };
}