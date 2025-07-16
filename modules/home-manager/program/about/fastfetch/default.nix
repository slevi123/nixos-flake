{pkgs, ...}: {
  home.packages = [
    pkgs.fastfetch
  ];

  home.file.".config/fastfetch/config.jsonc" = {
    source = ./dotfiles/config.jsonc;
    # recursive = true;
  };
}