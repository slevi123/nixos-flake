{ pkgs, inputs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  programs.vscode.profiles.qt-qml =
    let
      extension_repos = import ./globals/extension_repos.nix { inherit pkgs system inputs; };
    in
    {
      extensions = [
        extension_repos.community.vscode-marketplace.theqtcompany.qt-qml
        extension_repos.community.vscode-marketplace.theqtcompany.qt-core
        extension_repos.community.vscode-marketplace.theqtcompany.qt
      ]
      ++ (import ./globals/extensions.nix { inherit pkgs system inputs; });
      userSettings = {
        "qt-qml.qmlls.useQmlImportPathEnvVar" = true;
      }
      // (import ./globals/user-settings.nix);
    };
}
