{
  pkgs,
  inputs,
  system,
  ...
}:
with pkgs;
let
  my-jdk17 = jdk17.overrideAttrs (old: {
    meta = old.meta // {
      priority = 15;
    };
  });
  my-jdk21 = jdk21.overrideAttrs (old: {
    meta = old.meta // {
      priority = 5;
    };
  });
in
{
  home.packages = [
    my-jdk17
    my-jdk21
  ];

  programs.vscode.profiles.quarkus =
    let
      extension_repos = import ./globals/extension_repos.nix { inherit pkgs system inputs; };
    in
    {
      extensions = [
        extension_repos.community.vscode-marketplace.vscjava.vscode-java-pack
        extension_repos.community.vscode-marketplace.visualstudioexptteam.vscodeintellicode
        extension_repos.community.vscode-marketplace.redhat.java
        extension_repos.community.vscode-marketplace.vscjava.vscode-java-debug
        extension_repos.community.vscode-marketplace.vscjava.vscode-maven
        extension_repos.community.vscode-marketplace.vscjava.vscode-java-test
        extension_repos.community.vscode-marketplace.vscjava.vscode-java-dependency
        extension_repos.community.vscode-marketplace.vscjava.vscode-gradle
        extension_repos.community.vscode-marketplace.redhat.vscode-microprofile
        extension_repos.community.vscode-marketplace.redhat.vscode-quarkus
        extension_repos.community.vscode-marketplace.ms-azuretools.vscode-docker
      ]
      ++ (import ./globals/extensions.nix { inherit pkgs system inputs; });
      userSettings = {
        "redhat.telemetry.enabled" = false;

        "java.home" = "${my-jdk21}/lib/openjdk"; # Critical path setting
        "gradle.java.home" = "${my-jdk17}/lib/openjdk"; # Critical path setting
        "java.jdt.ls.java.home" = "${my-jdk21}/lib/openjdk";
        "java.configuration.runtimes" = [
          {
            name = "JavaSE-17";
            path = "${my-jdk17}/lib/openjdk";
            default = true;
          }
        ];
      }
      // (import ./globals/user-settings.nix);
    };
}
