{ pkgs, inputs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  programs.vscode.profiles.python =
    let
      extension_repos = import ./globals/extension_repos.nix { inherit pkgs system inputs; };
    in
    {
      extensions = [
        extension_repos.community.vscode-marketplace.ms-python.python
        extension_repos.community.vscode-marketplace.ms-python.debugpy
        extension_repos.nixpkgs.ms-python.vscode-pylance
        extension_repos.community.vscode-marketplace.the0807.uv-toolkit
      ]
      ++ (import ./globals/extensions.nix { inherit pkgs system inputs; });
      userSettings = {
        "files.exclude" = {
          "**/__pycache__/" = true;
        };
      }
      // (import ./globals/user-settings.nix);
    };
}
