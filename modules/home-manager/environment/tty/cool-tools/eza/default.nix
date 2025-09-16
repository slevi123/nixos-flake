{ ... }:
{
  programs.eza = {
    enable = true;
    colors = "auto";
    icons = "auto";
    git = true;
  };

  home.shellAliases = {
    ls = "eza";
    lstree = "exa --tree";
    ll = "exa -l";
    la = "exa -a";
    lla = "exa -la";
  };
}
