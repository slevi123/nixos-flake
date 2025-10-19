{ pkgs, ... }:
{
  imports = [

    # My shells
    ./zsh
    ./bash

    # zoxide is such a useful tool, when it isnt present, I feel like one of my arms is cut
    ./cool-tools/zoxide
  ];

  programs = {
    # git is good, git is essential for flakes (and other beloved projects)
    git.enable = true;
  };

  services = {
    # TUI command history 
    atuin.enable = true;
  };

  environment.systemPackages = with pkgs; [

    # drop-in replacement for ls 
    eza

    # fuzzy finder (for files)
    fzf

    # fast and user-friendly alternative to find
    fd
  ];
}
