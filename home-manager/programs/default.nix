{pkgs, config, ...}: {
  programs = {
    # Enable home-manager and git
    home-manager.enable = true;
    git.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    zsh = {
      enable = true;

      autocd = true;
      prezto.editor.keymap = "vi";
      autosuggestion = {
        enable = true;
      };

      history = {
        path = "${config.xdg.dataHome}/.histfile";
      };
    };
    bash = {
      enable = true;
    };

    atuin = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}