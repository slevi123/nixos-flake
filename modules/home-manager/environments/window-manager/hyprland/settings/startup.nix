{...}:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      "hyprsunset -t 5000"
      "swaync & avizo-service & udiskie --smart-tray"
      "waybar & hyprpaper & hypridle"
      "clipse -listen"
      "~/.charm/scripts/hyprland/custom-ipc-handler.sh"
    ];
  };
}