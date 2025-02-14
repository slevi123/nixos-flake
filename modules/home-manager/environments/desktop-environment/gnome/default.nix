{lib, osConfig, ...}:
{
  imports =
    lib.optionals osConfig.services.xserver.desktopManager.gnome.enable [
      ./dconf/settings.nix
      ./dconf/extension-settings.nix
      ./dconf/shortcuts.nix
      ./dconf/guake.nix
    ];
}