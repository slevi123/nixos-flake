{pkgs, ...}:
{
  home.packages = [
    pkgs.bat
  ];

  home.sessionVariables = {
    MANPAGER="bat -l man -p";
  };
}