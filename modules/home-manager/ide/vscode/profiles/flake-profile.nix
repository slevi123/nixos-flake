{
  pkgs,
  inputs,
  config,
  ...
}:
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
        # (extension_repos.community.vscode-marketplace.ssdev.wallrizz-theme.overrideAttrs (oldAttrs: rec {
        #   postInstall = ''
        #     ln -sf ${config.home.homeDirectory}/.local/share/wallrizz/wallrizz-theme.json $out/share/vscode/extensions/ssdev.wallrizz-theme/themes/wallrizz-theme.json
        #   '';
        # }))

        # extension_repos.community.open-vsx.RichardLuo.frosted-glass-theme

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
