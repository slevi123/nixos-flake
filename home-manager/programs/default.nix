{pkgs, ...}: {
  programs = {
    # Enable home-manager and git
    home-manager.enable = true;
    git.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}