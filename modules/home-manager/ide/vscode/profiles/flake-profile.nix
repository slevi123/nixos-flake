{ pkgs, inputs, ... }:
{
  programs.vscode.profiles.flake =
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
        extension_repos.community.vscode-marketplace.ewen-lbh.vscode-hyprls
        extension_repos.nixpkgs.jnoortheen.nix-ide

      ]
      ++ (import ./globals/extensions.nix {
        inherit pkgs;
        inherit inputs;
      });
      userSettings = {
        "nix.enableLanguageServer" = true; # Enable LSP.
        "nix.serverPath" = "nil"; # The path to the LSP server executable.

        "nix.serverSettings" = {
          "nil" = {
            "formatting" = {
              "command" = [ "nixfmt" ];
            };
          };
        };
      }
      // (import ./globals/user-settings.nix);
    };
}
