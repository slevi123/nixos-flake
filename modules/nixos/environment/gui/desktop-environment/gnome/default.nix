{lib, config, ...}: {
  # system.nixos.tags = lib.mkIf config.services.xserver.desktopManager.gnome.enable [ "gnome" ];
  services.desktopManager.gnome = {
    enable = true;
  };
}
