{ pkgs, inputs, ... }:
let
  inherit (pkgs) system;
in
{
  programs.vscode.profiles.bash =
    let
      extension_repos = import ./globals/extension_repos.nix {
        inherit pkgs system inputs;

      };
    in
    {
      extensions = [
        extension_repos.nixpkgs.mads-hartmann.bash-ide-vscode
      ]
      ++ (import ./globals/extensions.nix { inherit pkgs system inputs; });
      userSettings = { } // (import ./globals/user-settings.nix);
    };
}
