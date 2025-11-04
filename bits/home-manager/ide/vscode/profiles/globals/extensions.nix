{
  pkgs,
  inputs,
  system,
}:
let
  extension_repos = import ./extension_repos.nix { inherit pkgs system inputs; };
in
[
  extension_repos.nixpkgs.k--kato.intellij-idea-keybindings
  extension_repos.nixpkgs.mkhl.direnv
  extension_repos.nixpkgs.mhutchie.git-graph

  extension_repos.nixpkgs.gruntfuggly.todo-tree
  extension_repos.nixpkgs.naumovs.color-highlight

  extension_repos.community.vscode-marketplace.dlech.chmod
  # extension_repos.community.vscode-marketplace.vscodevim.vim

  # language support
  extension_repos.nixpkgs.tamasfe.even-better-toml
  # extension_repos.nixpkgs.bbenoist.nix # lightweight
  extension_repos.nixpkgs.jnoortheen.nix-ide

  extension_repos.community.vscode-marketplace.bierner.markdown-mermaid
  extension_repos.community.vscode-marketplace.mkhl.direnv

  # ---------- theme -----------
  extension_repos.nixpkgs.pkief.material-icon-theme
  # (extension_repos.community.vscode-marketplace.ssdev.wallrizz-theme.overrideAttrs (oldAttrs: rec {
  #   postInstall = ''
  #     ln -sf ${config.home.homeDirectory}/.local/share/wallrizz/wallrizz-theme.json $out/share/vscode/extensions/ssdev.wallrizz-theme/themes/wallrizz-theme.json
  #   '';
  # }))

  # extension_repos.community.open-vsx.RichardLuo.frosted-glass-theme

]
