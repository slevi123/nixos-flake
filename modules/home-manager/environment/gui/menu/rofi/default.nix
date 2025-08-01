{pkgs, ...}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    # FIXME: create input for themes and copy them into theme-selector
    theme = "/home/leswellhm/.local/share/rofi/themes/rounded-red-dark.rasi"; 
    location = "center";
  };
}