{
  pkgs,
  lib,
  ...
}:
with lib.hm.gvariant; {
  dconf.settings = {
    # =====================GUAKE===============================
    # TODO: maybe use guake yml in future
    "org/guake/general" = {
      compat-delete = "delete-sequence";
      display-n = 0;
      display-tab-names = 0;
      gtk-use-system-default-theme = true;
      hide-tabs-if-one-tab = true;
      history-size = 1000;
      infinite-history = true;
      #lazy-losefocus=false;
      load-guake-yml = true;
      max-tab-name-length = 100;
      mouse-display = true;
      open-tab-cwd = true;
      prompt-on-quit = true;
      quick-open-command-line = "code %(file_path)s";
      quick-open-enable = true;
      quick-open-in-current-terminal = false;
      restore-tabs-notify = false;
      restore-tabs-startup = true;
      save-tabs-when-changed = true;
      schema-version = "3.10";
      scroll-keystroke = true;
      start-at-login = true;
      startup-script = "";
      tab-ontop = false;
      use-default-font = false;
      use-login-shell = true;
      use-popup = false;
      use-scrollbar = false;
      use-trayicon = false;
      window-halignment = 0;
      window-height = 48;
      window-losefocus = false;
      window-refocus = false;
      window-ontop = false;
      window-tabbar = true;
      window-valignment = 1;
      window-vertical-displacement = 0;
      window-width = 100;
    };
    "org/guake/keybindings/global" = {
      show-hide = "F12";
    };

    "org/guake/keybindings/local" = {
      clipboard-copy = "<Primary><Shift>c";
      clipboard-paste = "<Primary><Shift>v";
      focus-terminal-down = "<Shift>Down";
      focus-terminal-left = "<Shift>Left";
      focus-terminal-right = "<Shift>Right";
      focus-terminal-up = "<Shift>Up";
      move-terminal-split-up = "disabled";
      search-on-web = "disabled";
      split-tab-vertical = "<Shift><Super>plus";
    };

    "org/guake/style" = {
      cursor-shape = 1;
    };
    "org/guake/style/background" = {
      transparency = 41;
    };
    "org/guake/style/font" = {
      allow-bold = true;
      bold-is-bright = true;
      palette = "#222233334444:#aaaa11112222:#3333aaaa1111:#ccccaaaa2222:#22225555cccc:#77775555aaaa:#2222bbbbcccc:#88889999aaaa:#555566667777:#ffff11113333:#3333ffff1111:#ffffdddd3333:#33337777ffff:#aaaa7777ffff:#3333ddddffff:#bbbbccccdddd:#ddddeeeeffff:#070713131717";
      palette-name = "Galizur";
      style = "Hack Nerd Font Mono 16";
    };
  };
}