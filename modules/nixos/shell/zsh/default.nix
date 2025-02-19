{...}:
{
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      zsh-autoenv.enable = true;

      shellInit = "eval \"$(zoxide init zsh)\"";
    };
  };
}
