{ pkgs, inputs, ... }:
{
  programs.vscode.profiles.flake =
    let
      extension_repos = import ./globals/extension_repos.nix {
        inherit pkgs;
        inherit inputs;
      };
    in
    {
      extensions = [
        extension_repos.community.vscode-marketplace.ewen-lbh.vscode-hyprls
      ]
      ++ (import ./globals/extensions.nix {
        inherit pkgs;
        inherit inputs;
      });
      userSettings = { } // (import ./globals/user-settings.nix);
    };
}
