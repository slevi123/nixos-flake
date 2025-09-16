{ pkgs, ... }:
{
  imports = [
    ./zoxide
  ];

  programs = {
    bat.enable = true;
    git.enable = true;
  };

  environment.systemPackages = with pkgs; [
    eza
    fzf
    # fff
  ];
}
