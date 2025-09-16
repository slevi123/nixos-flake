{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    nerd-fonts.code-new-roman
  ];
}
