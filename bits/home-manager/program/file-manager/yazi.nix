{ pkgs, ... }: {
  # home.packages = [
  #   pkgs.yazi
  # ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    plugin = {
      git = pkgs.yaziPlugins.git;
    };

    settings = {
      mgr = {
        # linemode = "permissions_and_size_and_mtime_and_owner";
      };
      # opener = {
      #   zathura = {
      #     run = "zathura \"$@\"";
      #     desc = "Open with zathura";
      #   };
      # };
      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
      };
    };
  };

  # programs.zsh.initContent = ''
  #   function y() {
  #     local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  #     yazi "$@" --cwd-file="$tmp"
  #     IFS= read -r -d '''' cwd < "$tmp"
  #     [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  #     rm -f -- "$tmp"
  #   }
  # '';
}
