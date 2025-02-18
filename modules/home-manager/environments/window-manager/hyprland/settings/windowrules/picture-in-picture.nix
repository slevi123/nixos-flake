{...}:
{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Tag: video for no transparency for video playing windows
      "float, title:Picture-in-Picture"
      "opacity 1.0 override, tag:video"
      "tag +video, title:Picture-in-Picture"
      "tag +video, title:(.*)(- Youtube)(.*)"
    ];

    bind = [
      "SUPER SHIFT, v, tagwindow, video"
    ];
  };
}