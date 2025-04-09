{...}:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      "hyprsunset -t 5000"
      "swaync & avizo-service"
      "udiskie --smart-tray &"
      "$CHARM_WALLPAPER &"
      "$CHARM_BAR &"
      "$CHARM_IDLE"
      "clipse -listen"
      "~/.charm/scripts/hyprland/custom-ipc-handler.sh"
      "echo hehe > /tmp/kortekiraly" 
    ];
  };
}
