{ pkgs, inputs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  programs.vscode.profiles.nextjs =
    let
      extension_repos = import ./globals/extension_repos.nix {
        inherit pkgs system inputs;

      };
    in
    {
      extensions = [
        extension_repos.community.vscode-marketplace.esbenp.prettier-vscode
      ]
      ++ (import ./globals/extensions.nix { inherit pkgs system inputs; });
      userSettings = {
        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
      }
      // (import ./globals/user-settings.nix);
    };
}
