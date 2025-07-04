{pkgs, inputs, ...}:
{
  programs.vscode.profiles.default = {
    extensions = with pkgs.vscode-extensions;
    with inputs.nix-vscode-extensions.extensions.${pkgs.system}; [
      k--kato.intellij-idea-keybindings
      mkhl.direnv
      mhutchie.git-graph

      # language support
      bbenoist.nix
      tamasfe.even-better-toml
      # kdl-org.kdl


      gruntfuggly.todo-tree
      pkief.material-icon-theme

      naumovs.color-highlight
      vscode-marketplace.ewen-lbh.vscode-hyprls
      vscode-marketplace.dlech.chmod
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