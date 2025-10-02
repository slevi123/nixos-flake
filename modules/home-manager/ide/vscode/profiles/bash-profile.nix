{ pkgs, inputs, ... }:
{
  programs.vscode.profiles.bash =
    let
      extension_repos = (
        import ./globals/extension_repos.nix {
          inherit pkgs;
          inherit inputs;
        }
      );
    in
    {
      extensions = [
        extension_repos.nixpkgs.mads-hartmann.bash-ide-vscode
      ]
      ++ (import ./globals/extensions.nix {
        inherit pkgs;
        inherit inputs;
      });
      userSettings = {
      }
      // (import ./globals/user-settings.nix);
    };
}
