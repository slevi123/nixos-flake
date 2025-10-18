{
  self,
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  stateVersion,
  ...
}:
{
  imports = [
    inputs.nix-index-database.homeModules.nix-index
    "${self}/bitss/home-manager/environment/languages"
    "${self}/bitss/home-manager/environment/tty/alpha.nix"

    "${self}/bitss/home-manager/program"

    "${self}/bitss/home-manager/ide/nixvim"
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}
