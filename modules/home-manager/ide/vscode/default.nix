{ ... }:
{
  imports = [
    ./profiles/default-profile.nix
    ./profiles/quarkus-profile.nix
    ./profiles/svelte-profile.nix
    ./profiles/python-profile.nix
    ./profiles/qml-profile.nix
    ./profiles/sysadmin-profile.nix
    ./profiles/flake-profile.nix
    ./profiles/bash-profile.nix
    ./profiles/embedded-profile.nix
  ];

  programs.vscode = {
    enable = true;
  };
}
