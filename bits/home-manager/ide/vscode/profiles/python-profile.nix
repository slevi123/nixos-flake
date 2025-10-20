{ pkgs, inputs, ... }:
{
  programs.vscode.profiles.python =
    let
      extension_repos = import ./globals/extension_repos.nix {
        inherit pkgs;
        inherit inputs;
      };
    in
    {
      extensions = [
        extension_repos.community.vscode-marketplace.ms-python.python
        extension_repos.community.vscode-marketplace.ms-python.debugpy
        extension_repos.nixpkgs.ms-python.vscode-pylance
      ]
      ++ (import ./globals/extensions.nix {
        inherit pkgs;
        inherit inputs;
      });
      userSettings = {
        "files.exclude" = {
          "**/__pycache__/" = true;
        };
      }
      // (import ./globals/user-settings.nix);
    };
}
