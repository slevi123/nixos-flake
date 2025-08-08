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
#       permission = /nix/store/[a-z0-9]{32}-grim-[0-9.]*/bin/grim, screencopy, allow
# permission = /nix/store/[a-z0-9]{32}-xdg-desktop-portal-hyprland-[0-9.]*/libexec/.xdg-desktop-portal-hyprland-wrapped, screencopy, allow
    ];
  };
}