{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      k--kato.intellij-idea-keybindings
      mkhl.direnv
      mhutchie.git-graph

      # language support
      bbenoist.nix
      tamasfe.even-better-toml
      gruntfuggly.todo-tree
      pkief.material-icon-theme
      # ewen-lbh.vscode-hyprls # not added yet to nixpkgs
    ];
    userSettings = {
      "editor.fontFamily" = "'Hack Nerd Font Mono', 'monospace', monospace";
      "files.autoSave" = "afterDelay";
      "workbench.colorTheme" = "Wal";
      "workbench.iconTheme" = "material-icon-theme";
      "window.menuBarVisibility" = "toggle";
      "editor.scrollbar.vertical" = "hidden";
    };
  };
}
