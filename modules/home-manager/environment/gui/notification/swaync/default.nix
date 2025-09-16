{ ... }:
{
  home.file.".config/swaync" = {
    source = ./dotfiles/swaync;
    recursive = true;
  };
}
