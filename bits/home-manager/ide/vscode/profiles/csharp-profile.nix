{ pkgs, inputs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  programs.vscode.profiles.dotnet =
    let
      extension_repos = import ./globals/extension_repos.nix { inherit pkgs system inputs; };
    in
    {
      extensions = [
        extension_repos.nixpkgs.ms-dotnettools.csdevkit
        extension_repos.nixpkgs.patcx.vscode-nuget-gallery
      ]
      ++ (import ./globals/extensions.nix { inherit pkgs system inputs; });
      userSettings = {
      }
      // (import ./globals/user-settings.nix);
    };
}
