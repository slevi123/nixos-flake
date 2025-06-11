{config, ...}:
{
  programs = {
    zsh = {
      enable = true;

      autocd = true;
      # prezto.editor.keymap = "vi";
      autosuggestion = {
        enable = true;
      };

      syntaxHighlighting = {
        enable = true;
        highlighters = [
          "brackets"
          # "cursor"
        ];
      };

      history = {
        path = "${config.xdg.dataHome}/.histfile";
        extended = true; # save timestamps
      };

      initContent = ''
        # Bind Ctrl + Left Arrow to move backward by word
        bindkey "^[[1;5D" backward-word
        # Bind Ctrl + Right Arrow to move forward by word
        bindkey "^[[1;5C" forward-word
      '';
    };
  };
}
