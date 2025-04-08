{pkgs, ...}:
{
  home.packages = with pkgs.jetbrains; [
    pycharm-professional
    idea-ultimate
    clion
  ];
}