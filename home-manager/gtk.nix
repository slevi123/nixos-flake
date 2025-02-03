{pkgs, ...}: {
  gtk = {
    enable = true;
    # font.name = "TeX Gyre Adventor 10";
    font.name = "Hack Nerd Font Mono 16";
    theme = {
      name = "Adwaita";
      # package = pkgs.gtk3-theme;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
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