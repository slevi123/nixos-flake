{
  "editor.fontFamily" = "'Hack Nerd Font Mono', 'monospace', monospace";
  "files.autoSave" = "afterDelay";
  "workbench.colorTheme" = "Abyss";
  # "workbench.colorTheme" = "WallRizz Theme";
  "workbench.iconTheme" = "material-icon-theme";
  "window.menuBarVisibility" = "toggle";
  "editor.scrollbar.vertical" = "hidden";

  # ---- nix ----
  "nix.enableLanguageServer" = true; # Enable LSP.
  "nix.serverPath" = "nil"; # The path to the LSP server executable.

  "nix.serverSettings" = {
    "nil" = {
      "formatting" = {
        "command" = [ "nixfmt" ];
      };
    };
  };

  "typescript.updateImportsOnFileMove.enabled" = "always";
}
