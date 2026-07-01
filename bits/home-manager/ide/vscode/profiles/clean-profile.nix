{ pkgs, inputs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  programs.vscode.profiles.clean =
    let
      extension_repos = import ./globals/extension_repos.nix {
        inherit pkgs system inputs;

      };
    in
    {
      extensions = [
        extension_repos.community.vscode-marketplace.topsoftware.clean-vs-code
      ]
      ++ (import ./globals/extensions.nix { inherit pkgs system inputs; });
      userSettings = { } // (import ./globals/user-settings.nix);
    };
}
