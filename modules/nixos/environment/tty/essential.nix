{ pkgs, ... }:
{
    imports = [
    ./zsh
    ./bash

    ./zoxide
    
  ];

  programs = {
    git.enable = true;
  };

  environment.systemPackages = with pkgs; [
    eza
    fzf
    fd
    # fff
  ];
}
