{ pkgs, inputs }:
{
  nixpkgs = pkgs.vscode-extensions;
  community = inputs.nix-vscode-extensions.extensions.${pkgs.system};
  nix4vscode = pkgs.nix4vscode;
}
