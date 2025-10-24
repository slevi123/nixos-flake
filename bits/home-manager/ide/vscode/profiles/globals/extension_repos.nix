{ pkgs, inputs, system }:
{
  nixpkgs = pkgs.vscode-extensions;
  
  # must use system [wrong format ...]
  community = inputs.nix-vscode-extensions.extensions.${system};
  inherit (pkgs) nix4vscode;
}
