{
  pkgs,
  inputs,
}:
let
  extension_repos = (
    import ./extension_repos.nix {
      inherit pkgs;
      inherit inputs;
    }
  );
in
[
  extension_repos.nixpkgs.k--kato.intellij-idea-keybindings
  extension_repos.nixpkgs.mkhl.direnv
  extension_repos.nixpkgs.mhutchie.git-graph

  extension_repos.nixpkgs.gruntfuggly.todo-tree
  extension_repos.nixpkgs.pkief.material-icon-theme
  extension_repos.nixpkgs.naumovs.color-highlight

  extension_repos.community.vscode-marketplace.dlech.chmod
  # extension_repos.community.vscode-marketplace.vscodevim.vim

  # langauge support
  extension_repos.nixpkgs.bbenoist.nix
  extension_repos.nixpkgs.tamasfe.even-better-toml
]
