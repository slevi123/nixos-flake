{
  pkgs,
  inputs,
  system,
  ...
}:
{
  programs.vscode.profiles.default = {
    extensions = import ./globals/extensions.nix { inherit pkgs system inputs; };
    userSettings = import ./globals/user-settings.nix;
  };
}
