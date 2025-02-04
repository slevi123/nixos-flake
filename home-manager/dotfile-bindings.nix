{pkgs, ...}: {
  # home.file
  home.file = {
    ".config/hypr" = {
      source = ./dotfiles/hypr;
      recursive = true;
    };
    # ".config/rofi" = {
    #     source = ./dotfiles/rofi;
    #     recursive = true;
    # };
    ".config/waybar" = {
      source = ./dotfiles/waybar;
      recursive = true;
    };
    ".config/swaync" = {
      source = ./dotfiles/swaync;
      recursive = true;
    };
  };
}
