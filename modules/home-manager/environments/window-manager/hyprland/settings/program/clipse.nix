{...}:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "SUPER, V, exec,  kitty --class clipse -e 'clipse' && wtype -M ctrl -k v -m ctrl" 
    ];
    windowrulev2 = [
      "float,class:(clipse)" # ensure you have a floating window class set if you want this behavior
      "size 622 652,class:(clipse)" # set the size of the window as necessary
    ];
  };
}
