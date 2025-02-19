{config, ...}:
{
  programs = {
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
  };
}