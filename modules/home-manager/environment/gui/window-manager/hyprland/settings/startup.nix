{...}:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      "hyprsunset -t 5000"
      "swaync & avizo-service &"
      "udiskie --smart-tray &"
      "$CHARM_BAR &"
      "$CHARM_IDLE &"
      "clipse -listen &"
      "$CHARM_WALLPAPER &"
      "~/.charm/scripts/hyprland/custom-ipc-handler.sh"
    ];

    execr-once = [
    ];
  };
}
