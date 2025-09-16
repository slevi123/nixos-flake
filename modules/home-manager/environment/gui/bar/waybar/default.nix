{ ... }:
{
  home.file.".config/waybar" = {
    source = ./dotfiles/waybar;
    recursive = true;
  };

  home.sessionVariables = {
    CHARM_BAR = "waybar";
  };
  # programs.enable
}
