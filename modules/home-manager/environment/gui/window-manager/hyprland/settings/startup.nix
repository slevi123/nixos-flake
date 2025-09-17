{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      "hyprsunset -t 5000"
      "swaync & avizo-service"
      "udiskie --smart-tray"
      "uwsm app -- $CHARM_BAR"
      "$CHARM_IDLE &"
      "clipse -listen"
      "hyprpaper"
      "~/.charm/scripts/hyprland/custom-ipc-handler.sh"
      "battery-notify"
    ];

    execr-once = [
    ];
  };
}
