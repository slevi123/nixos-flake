{ pkgs, inputs, ... }:
{
  programs.vscode.profiles.default = {
    extensions = import ./globals/extensions.nix {
      inherit pkgs;
      inherit inputs;
    };
    userSettings = import ./globals/user-settings.nix;
  };
}
