{ pkgs, ... }:
{
  imports = [
    ./zoxide
    ./yazi
  ];

  programs = {
    bat.enable = true;
    git.enable = true;

    # ------TUI------
    lazygit.enable = true;
    # lazydocker.enable = true;
  };

  services = {
    atuin.enable = true;
  };

  environment.systemPackages = with pkgs; [
    eza
    fzf
    fd
  ];
}
