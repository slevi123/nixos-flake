{ self, inputs, ... }:
{
  imports = [
    inputs.nix-index-database.homeModules.nix-index
    "${self}/bits/home-manager/environment/languages"
    "${self}/bits/home-manager/environment/tty/alpha.nix"

    "${self}/bits/home-manager/program"

    "${self}/bits/home-manager/ide/nixvim"
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}
