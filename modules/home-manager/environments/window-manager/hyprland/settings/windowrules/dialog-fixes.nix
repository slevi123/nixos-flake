{...}:
{
  wayland.windowManager.hyprland.settings = {
    # fix for electron dialogs
    "$openfolderregex" = "title:(.*)([Oo]pen [Ff]older)(.*)";
    "$openfileregex" = "title:(.*)([Oo]pen [Ff]ile)(.*)";
    windowrulev2 = [
      "float, $openfileregex"
      "center 1, $openfileregex"
      "float, $openfolderregex"
      "center 1, $openfolderregex"
    ];
    # and gtk portal (dialogs), temporary solution until I learn more about portals

  };
}