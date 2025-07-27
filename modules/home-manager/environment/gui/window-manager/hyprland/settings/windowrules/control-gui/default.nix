{...}:
{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "float, tag:control"
      "center 1, tag:control"

      "tag +control, class:org.pulseaudio.pavucontrol"
      "size 70% 68%, tag:control"
    ];
    # and gtk portal (dialogs), temporary solution until I learn more about portals
    
  };
}