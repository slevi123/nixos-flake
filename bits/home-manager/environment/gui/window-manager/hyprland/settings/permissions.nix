_: {
  wayland.windowManager.hyprland.settings = {
    ecosystem = {
      enforce_permissions = true;
    };
    permission = [
      # "/nix/store/.*-hyprland-.*/bin/hyprctl, plugin, allow"
      "/nix/store/[a-z0-9]{32}-hyprland-[0-9.]*/bin/hyprctl, plugin, allow"
      # "/nix/store/.*-hyprpicker-.*/bin/hyprpicker, screencopy, allow"
      "/nix/store/[a-z0-9]{32}-hyprpicker-[0-9.]*/bin/hyprpicker, screencopy, allow"
      "/nix/store/[a-z0-9]{32}-hyprshot-[0-9.]*/bin/hyprshot, screencopy, allow"
      "/nix/store/[a-z0-9]{32}-grim-[0-9.]*/bin/grim, screencopy, allow"
      "/nix/store/[a-z0-9]{32}-hyprlock-[0-9.]*/bin/hyprlock, screencopy, allow"
    ];
  };
}
