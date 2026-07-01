{ pkgs, inputs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  home.packages = [
    pkgs.clang-tools
  ];

  programs.vscode.profiles.clang =
    let
      extension_repos = import ./globals/extension_repos.nix {
        inherit pkgs system inputs;

      };
    in
    {
      extensions = [
        extension_repos.nixpkgs.llvm-vs-code-extensions.vscode-clangd
      ]
      ++ (import ./globals/extensions.nix { inherit pkgs system inputs; });
      userSettings = { } // (import ./globals/user-settings.nix);
    };
}
