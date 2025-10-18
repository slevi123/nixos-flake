{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # "systemctl --user start hyprpolkitagent"
      "uwsm app hyprsunset -t 5000"
      # "uwsm app swaync"
      "uwsm app avizo-service"
      "uwsm app -- udiskie --smart-tray"
      "uwsm app -- $CHARM_BAR"
      "uwsm app -- $CHARM_IDLE"
      "uwsm app -- clipse -listen"
      "uwsm app hyprpaper"
      "uwsm app ~/.charm/scripts/hyprland/custom-ipc-handler.sh"
      "RUST_LOG=none uwsm app battery-notify"
    ];

    execr-once = [
    ];
  };
}
