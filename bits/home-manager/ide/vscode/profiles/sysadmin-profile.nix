{
  pkgs,
  inputs,
  system,
  ...
}:
{
  programs.vscode.profiles.sysadmin =
    let
      extension_repos = import ./globals/extension_repos.nix { inherit pkgs system inputs; };
    in
    {
      extensions = [
        extension_repos.community.vscode-marketplace.emilast.logfilehighlighter
      ]
      ++ (import ./globals/extensions.nix { inherit pkgs system inputs; });
      userSettings = { } // (import ./globals/user-settings.nix);
    };
}
