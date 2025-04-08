{pkgs, ...}: {
  imports = [
    ./profiles/default-profile.nix
  ];

  programs.vscode = {
    enable = true;
  };
}
