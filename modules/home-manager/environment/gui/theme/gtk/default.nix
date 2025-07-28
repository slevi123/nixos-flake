{ pkgs, ... }: {
  gtk = {
    enable = true;
    font.name = "Hack Nerd Font Mono 16";

    theme = {
      # name = "Materia-dark";  # Or your chosen theme name
      # package = pkgs.materia-theme; # Or your chosen package

      name = "Breeze-Dark";
      package = pkgs.libsForQt5.breeze-gtk;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };

    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };
}