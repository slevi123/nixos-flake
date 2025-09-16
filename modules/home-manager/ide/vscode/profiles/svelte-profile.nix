{ pkgs, inputs, ... }:
{
  programs.vscode.profiles.svelte = {
    extensions =
      with pkgs.vscode-extensions;
      with inputs.nix-vscode-extensions.extensions.${pkgs.system};
      [
        k--kato.intellij-idea-keybindings
        mkhl.direnv
        mhutchie.git-graph

        # language support
        tamasfe.even-better-toml
        # kdl-org.kdl

        gruntfuggly.todo-tree
        pkief.material-icon-theme

        naumovs.color-highlight
        bradlc.vscode-tailwindcss
        vscode-marketplace."1yib".svelte-bundle
        # ewen-lbh.vscode-hyprls # not added yet to nixpkgs
      ];
    userSettings = {
      "editor.fontFamily" = "'Hack Nerd Font Mono', 'monospace', monospace";
      "files.autoSave" = "afterDelay";
      "workbench.colorTheme" = "Wal";
      "workbench.iconTheme" = "material-icon-theme";
      "window.menuBarVisibility" = "toggle";
      "editor.scrollbar.vertical" = "hidden";
      "svelte.enable-ts-plugin" = true;
    };
  };
}
