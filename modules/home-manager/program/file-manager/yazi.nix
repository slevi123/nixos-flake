{pkgs, ...}:
{
  # home.packages = [
  #   pkgs.yazi
  # ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
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