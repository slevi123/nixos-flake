{ pkgs, inputs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  programs.vscode.profiles.astro =
    let
      extension_repos = import ./globals/extension_repos.nix {
        inherit pkgs system inputs;

      };
    in
    {
      extensions = [
        extension_repos.nixpkgs.astro-build.astro-vscode
      ]
      ++ (import ./globals/extensions.nix { inherit pkgs system inputs; });
      userSettings = { } // (import ./globals/user-settings.nix);
    };
}
