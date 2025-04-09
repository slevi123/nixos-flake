{
  self,
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [ 
    inputs.nix-index-database.hmModules.nix-index
    "${self}/modules/home-manager/environment/languages"
    "${self}/modules/home-manager/environment/tty/alpha.nix"

    "${self}/modules/home-manager/program"

    "${self}/modules/home-manager/ide/nixvim"
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
