{pkgs, ...}: {
  imports = [
    ./profiles/default-profile.nix
    ./profiles/quarkus-profile.nix
    ./profiles/svelte-profile.nix
  ];

  programs.vscode = {
    enable = true;
  };
}
