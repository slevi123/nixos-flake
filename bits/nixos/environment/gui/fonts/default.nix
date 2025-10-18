{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      aurulent-sans
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      nerd-fonts.code-new-roman
    ];
    enableDefaultPackages = true;
  };

  environment.systemPackages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    nerd-fonts.code-new-roman
  ];
}
