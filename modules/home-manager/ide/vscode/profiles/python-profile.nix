{pkgs, inputs, ...}:
{
  programs.vscode.profiles.python =   
  # let
  #   nixpkgs-unfree = (import inputs.nixpkgs {
  #     system = pkgs.system;
  #     config = {
  #       allowUnfree = true;
  #     };
  #   });
  #   nix-vscode-extensions-unfree = (import inputs.nix-vscode-extensions {
  #     pkgs = nixpkgs-unfree;
  #   });

  #   unfree-extensions = nix-vscode-extensions-unfree.extensions.${pkgs.system}; 
  # in 
  {
    extensions = with pkgs.vscode-extensions;
    with inputs.nix-vscode-extensions.extensions.${pkgs.system};
    [
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
      
      vscode-marketplace.ms-python.python
      vscode-marketplace.ms-python.debugpy
      ms-python.vscode-pylance
      # vscode-marketplace.vscodevim.vim

    ];
    userSettings = {
      "editor.fontFamily" = "'Hack Nerd Font Mono', 'monospace', monospace";
      "files.autoSave" = "afterDelay";
      "workbench.colorTheme" = "Wal";
      "workbench.iconTheme" = "material-icon-theme";
      "window.menuBarVisibility" = "toggle";
      "editor.scrollbar.vertical" = "hidden";

      "files.exclude" = {
        "**/__pycache__/" = true;
      };
    };
  };
}