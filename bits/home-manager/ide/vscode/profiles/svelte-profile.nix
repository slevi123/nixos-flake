{ pkgs, inputs, ... }:
{
  programs.vscode.profiles.svelte =
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
        extension_repos.nixpkgs.naumovs.color-highlight
        extension_repos.nixpkgs.bradlc.vscode-tailwindcss
        extension_repos.community.vscode-marketplace."1yib".svelte-bundle
      ]
      ++ (import ./globals/extensions.nix {
        inherit pkgs;
        inherit inputs;
      });
      userSettings = {
        "svelte.enable-ts-plugin" = true;
      }
      // (import ./globals/user-settings.nix);
    };
}
