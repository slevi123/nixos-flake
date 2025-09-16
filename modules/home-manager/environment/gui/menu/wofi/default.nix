{ ... }:
{
  programs.wofi = {
    enable = true;
    style = builtins.readFile ./style.css;

    settings = {
      allow_markup = true;
      insensitive = true;
    };
  };
}
