{pkgs, inputs, ...}:
{
  home.packages = [pkgs.jdk21];

  programs.vscode.profiles.quarkus = {
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
      vscode-marketplace.redhat.java
      vscode-marketplace.vscjava.vscode-java-debug
      vscode-marketplace.redhat.vscode-microprofile
      vscode-marketplace.redhat.vscode-quarkus
      vscode-marketplace.vscjava.vscode-java-pack
      # ewen-lbh.vscode-hyprls # not added yet to nixpkgs
    ];
    userSettings = {
      "editor.fontFamily" = "'Hack Nerd Font Mono', 'monospace', monospace";
      "files.autoSave" = "afterDelay";
      "workbench.colorTheme" = "Wal";
      "workbench.iconTheme" = "material-icon-theme";
      "window.menuBarVisibility" = "toggle";
      "editor.scrollbar.vertical" = "hidden";
      "redhat.telemetry.enabled" = true;

      "java.home" = "${pkgs.jdk21}/lib/openjdk";  # Critical path setting
      "java.jdt.ls.java.home" = "${pkgs.jdk21}/lib/openjdk";
      "java.configuration.runtimes" = [
        {
          name = "JavaSE-21";
          path = "${pkgs.jdk21}/lib/openjdk";
          default = true;
        }
      ];
    };
  };
}