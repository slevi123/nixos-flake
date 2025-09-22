{ ... }:
{
  imports = [
    ./profiles/default-profile.nix
    ./profiles/quarkus-profile.nix
    ./profiles/svelte-profile.nix
    ./profiles/python-profile.nix
    ./profiles/qml-profile.nix
    ./profiles/sysadmin-profile.nix
    ./profiles/nix-profile.nix
    ./profiles/bash-profile.nix
  ];

  programs.vscode = {
    enable = true;
  };
}
