{pkgs, ...}:
{
  home.packages = with pkgs; [
    pkgs.pnpm
  ];
}