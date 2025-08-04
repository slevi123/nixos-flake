{pkgs, ...}:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    

    # diff, only one
    # delta.enable = true; # fast, only syntaxhighlight
    difftastic.enable = true; # slow, but langauage aware
  };

  programs = {
    # TUI tool
    gitui.enable = true;
    # lazygit.enable = true;

    # Changelog generator
    git-cliff.enable = true;

    git-worktree-switcher = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };

  home.packages = [
    pkgs.gitoxide  # rust git implementation
  ];
}