{lib, osConfig, ...}:
{
  imports =
    lib.optionals osConfig.services.desktopManager.gnome.enable [
      ./extensions.nix
      ./dconf/settings.nix
      ./dconf/extension-settings.nix
      ./dconf/shortcuts.nix
      ./dconf/guake.nix
    ];
}