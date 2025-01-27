{pkgs, ...} : {
    # home.file
    home.file = {
        ".config/rofi" = {
            source = ./dotfiles/rofi;
            recursive = true;
        };
        ".config/hypr" = {
            source = ./dotfiles/hypr;
            recursive = true;
        };
    };
}