{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs = {
    # TUI tool
    gitui.enable = true;
    # lazygit.enable = true;

    # Changelog generator
    git-cliff.enable = true;

    # diff, only one
    # delta.enable = true; # fast, only syntaxhighlight
    difftastic = {
      # slow, but languaage aware
      enable = true;
      git = {
        enable = true;
        diffToolMode = true;
      };
    };

    git-worktree-switcher = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };

  home.packages = [
    pkgs.gitoxide # rust git implementation
    pkgs.git-town # git automaitons (for various workflows)
  ];
}
