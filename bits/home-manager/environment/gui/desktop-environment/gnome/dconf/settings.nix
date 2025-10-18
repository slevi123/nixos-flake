{
  pkgs,
  lib,
  ...
}:
with lib.hm.gvariant;
{
  dconf.settings = {
    # ==========GNOME SETTINGS=============================
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
      text-scaling-factor = 1.25;
    };

    # keyboard layouts
    "org/gnome/desktop/input-sources" = {
      mru-sources = [
        (mkTuple [
          "xkb"
          "us"
        ])
        (mkTuple [
          "xkb"
          "hu+qwerty"
        ])
      ];
      sources = [
        (mkTuple [
          "xkb"
          "us"
        ])
        (mkTuple [
          "xkb"
          "hu+qwerty"
        ])
        (mkTuple [
          "xkb"
          "ro"
        ])
      ];
      xkb-options = [
        "terminate:ctrl_alt_bksp"
        "lv3:ralt_switch"
      ];
    };
  };
}
