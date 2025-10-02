{ pkgs, inputs, ... }:
{
  programs.vscode.profiles.sysadmin = 
  let
    extension_repos = (import ./globals/extension_repos.nix { inherit pkgs; inherit inputs; });
  in {
    extensions = [
      extension_repos.community.vscode-marketplace.emilast.logfilehighlighter
    ] ++ (import ./globals/extensions.nix { inherit pkgs; inherit inputs; });
    userSettings = {
    } // (import ./globals/user-settings.nix);
  };
}
