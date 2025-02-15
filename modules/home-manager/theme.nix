{pkgs, ...}: {
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

  gtk = {
    enable = false;
    # font.name = "TeX Gyre Adventor 10";
    font.name = "Hack Nerd Font Mono 16";
    theme = {
      name = "Adwaita";
      # package = pkgs.gtk3-theme;
    };
    # iconTheme = {
    # name = "Posys Cursor";
    # package = pkgs.posy-cursors;
    # };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1;
      '';
    };
  };
}
