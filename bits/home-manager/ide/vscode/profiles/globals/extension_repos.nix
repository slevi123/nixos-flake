{ pkgs, inputs }:
{
  nixpkgs = pkgs.vscode-extensions;
  community = inputs.nix-vscode-extensions.extensions.${pkgs.system};
  inherit (pkgs) nix4vscode;
}
