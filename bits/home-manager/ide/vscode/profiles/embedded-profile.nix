{ pkgs, inputs, ... }:
{
  home.packages = [
    pkgs.platformio
    # pkgs.platformio-core
  ];

  # home.sessionVariables = [

  # ];

  programs.vscode.profiles.embedded =
    let
      extension_repos = import ./globals/extension_repos.nix {
        inherit pkgs;
        inherit inputs;
      };
    in
    {
      extensions = [
        extension_repos.nixpkgs.ms-vscode.cpptools
        extension_repos.nixpkgs.platformio.platformio-vscode-ide
      ]
      ++ (import ./globals/extensions.nix {
        inherit pkgs;
        inherit inputs;
      });
      userSettings = {
        "platformio-ide.useBuiltinPIOCore" = false;
      }
      // (import ./globals/user-settings.nix);
    };
}
