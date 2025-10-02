{ pkgs, inputs, ... }:
{
  programs.vscode.profiles.default = 
  let
    extension_repos = (import ./globals/extension_repos.nix { inherit pkgs; inherit inputs; });
  in {
    extensions = [
    ] ++ (import ./globals/extensions.nix { inherit pkgs; inherit inputs; });
    userSettings = {
    } // (import ./globals/user-settings.nix);
  };
}
