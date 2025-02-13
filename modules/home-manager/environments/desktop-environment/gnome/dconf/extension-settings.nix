{
  pkgs,
  lib,
  ...
}:
with lib.hm.gvariant; {
  dconf.settings = { 
    # ----------GNOME EXTENSION SETTINGS-----------------------
    "org/gnome/shell" = {
      enabled-extensions = [
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        pkgs.gnomeExtensions.emoji-copy.extensionUuid
        "mediacontrols@cliffniff.github.com"
        "clipboard-history@alexsaveau.dev"
        "autohide-battery@sitnik.ru"
        "monitor@astraext.github.io"
        "burn-my-windows@schneegans.github.com"
        "xwayland-indicator@swsnr.de"
      ];
    };

    "org/gnome/shell/extensions/clipboard-history" = {
      cache-size = 435;
      display-mode = 1;
      history-size = 700;
      private-mode = false;
      toggle-menu = ["<Super>v"];
      window-width-percentage = 38;
    };

    "org/gnome/shell/extensions/emoji-copy" = {
      always-show = false;
    };

    "org/gnome/shell/extensions/mediacontrols" = {
      # element-order=['menu', 'title', 'controls', 'icon']
      extension-index = mkUint32 2;
      extension-position = "Left";
      hide-media-notification = true;
      # max-widget-width=300
      # mouse-action-double='NEXT_TRACK'
      # mouse-action-left='PLAY_PAUSE'
      # mouse-action-middle='SHOW_POPUP_MENU'
      # mouse-action-right='PLAY_PAUSE'
      # mouse-actions=['toggle_play', 'toggle_info', 'toggle_menu', 'next', 'previous', 'none', 'none', 'none']
      # prefer-using-seek=false
      # show-control-icons=false
      # show-player-icon=false
      # show-seperators=false
      # show-sources-menu=false
      # track-label=['track', '-', 'artist']
    };
  };
}