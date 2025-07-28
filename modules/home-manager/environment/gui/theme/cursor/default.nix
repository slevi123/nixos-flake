{pkgs, ...}:
{
  home.pointerCursor = {
    # package = pkgs.vanilla-dmz;
    # name = "Vanilla-DMZ";
    # name = "Posy_Cursor";
    name = "Posy_Cursor_125_175";
    package = pkgs.posy-cursors;
    gtk.enable = true;
    x11.enable = true;
    size = 32; # Adjust the size as needed
  };
}