{pkgs, ...}: {
  imports = [
    ./profiles/default-profile.nix
    ./profiles/quarkus-profile.nix
    ./profiles/svelte-profile.nix
    ./profiles/python-profile.nix
  ];

  programs.vscode = {
    enable = true;
  };
}
