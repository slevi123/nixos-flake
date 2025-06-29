{pkgs, inputs, ...}:
with pkgs; let 
  my-jdk17 =  (jdk17.overrideAttrs (old: {
    meta = old.meta // { priority = 15; };
  }));
  my-jdk21 = (jdk21.overrideAttrs (old: {
    meta = old.meta // { priority = 5; };
  }));
in
{
  home.packages = with pkgs; [
    my-jdk17 my-jdk21
];

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
      vscode-marketplace.vscjava.vscode-java-pack
      vscode-marketplace.visualstudioexptteam.vscodeintellicode
      vscode-marketplace.redhat.java
      vscode-marketplace.vscjava.vscode-java-debug
      vscode-marketplace.vscjava.vscode-maven
      vscode-marketplace.vscjava.vscode-java-test
      vscode-marketplace.vscjava.vscode-java-dependency
      vscode-marketplace.vscjava.vscode-gradle
      vscode-marketplace.redhat.vscode-microprofile
      vscode-marketplace.redhat.vscode-quarkus
      vscode-marketplace.ms-azuretools.vscode-docker
    ];
    userSettings = {
      "editor.fontFamily" = "'Hack Nerd Font Mono', 'monospace', monospace";
      "files.autoSave" = "afterDelay";
      "workbench.colorTheme" = "Wal";
      "workbench.iconTheme" = "material-icon-theme";
      "window.menuBarVisibility" = "toggle";
      "editor.scrollbar.vertical" = "hidden";
      "redhat.telemetry.enabled" = true;

      "java.home" = "${my-jdk21}/lib/openjdk";  # Critical path setting
      "gradle.java.home" = "${my-jdk17}/lib/openjdk";  # Critical path setting
      "java.jdt.ls.java.home" = "${my-jdk21}/lib/openjdk";
      "java.configuration.runtimes" = [
        {
          name = "JavaSE-17";
          path = "${my-jdk17}/lib/openjdk";
          default = true;
        }
      ];
    };
  };
}