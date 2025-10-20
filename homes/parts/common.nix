{ stateVersion, ... }:
{
  imports = [ ];

  home = {
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = stateVersion;
}
