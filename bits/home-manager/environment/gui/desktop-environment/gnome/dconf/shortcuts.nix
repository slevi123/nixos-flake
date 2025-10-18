{
  pkgs,
  lib,
  ...
}:
with lib.hm.gvariant;
{
  dconf.settings = {
    # ----------GNOME CUSTOM SHORTCUTS---------------------
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "Blackbox Terminal";
      binding = "<Super>t";
      command = "blackbox";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Dropdown Terminal";
      binding = "<Alt>t";
      command = "guake-toggle";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Ulauncher-toggle";
      binding = "<Control>space";
      command = "ulauncher-toggle";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Firefox";
      binding = "<Super>f";
      command = "nvidia-offload firefox";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      name = "Search Selected";
      binding = "<Control>KP_Divide";
      command = "bash -c 'firefox \"https://www.google.com/search?q=$(xsel -o)\"'";
    };

    # ----------GNOME BUILT-IN SHORTCUTS---------------------

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      minimize = "@as []";
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = "@as []";
      toggle-message-tray = [ "<Super>n" ];
    };
  };
}
