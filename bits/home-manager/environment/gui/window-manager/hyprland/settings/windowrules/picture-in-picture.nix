{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$piptitle" = "Picture[ -]in[ -][Pp]icture";

    windowrulev2 = [
      # Tag: video for no transparency for video playing windows
      "float, title:$piptitle"
      "size 507 285, title:$piptitle"
      "move 67% 8%, title: $piptitle"
      "pin, title:$piptitle"

      "tag +video, title:$piptitle"
      "tag +video, title:(.*)(- Youtube)(.*)"
      "opacity 1.0 override, tag:video"
      "opacity 1.0 override, tag:video*"

    ];

    bind = [
      "SUPER SHIFT, v, tagwindow, video"
    ];
  };
}
