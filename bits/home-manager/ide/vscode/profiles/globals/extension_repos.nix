{ pkgs, inputs, system }:
{
  nixpkgs = pkgs.vscode-extensions;
  community = inputs.nix-vscode-extensions.extensions.${system};
  inherit (pkgs) nix4vscode;
}
