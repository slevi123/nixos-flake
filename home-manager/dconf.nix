{pkgs, lib, ...} : 
with lib.hm.gvariant;
{
    dconf.settings = {
        # ==========GNOME SETTINGS=============================
        "org/gnome/desktop/interface" = {
            color-scheme="prefer-dark";
            enable-hot-corners = false;
            show-battery-percentage=true;
            text-scaling-factor=1.25;
        };
        # ----------GNOME CUSTOM SHORTCUTS---------------------
        "org/gnome/settings-daemon/plugins/media-keys" = {
            custom-keybindings=[
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" 
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
            ];
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
            name="Blackbox Terminal";
            binding="<Super>t";
            command="blackbox";
        };
        
       "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            name="Dropdown Terminal";
            binding="<Alt>t";
            command="guake-toggle";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
            name="Ulauncher-toggle";
            binding="<Control>space";
            command="ulauncher-toggle";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
            name="Firefox";
            binding="<Super>f";
            command="nvidia-offload firefox";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
            name="Search Selected";
            binding="<Control>KP_Divide";
            command="bash -c 'firefox \"https://www.google.com/search?q=$(xsel -o)\"'";
        };


        # ----------GNOME BUILT-IN SHORTCUTS---------------------

        "org/gnome/desktop/wm/keybindings" = {
            close = [ "<Super>q" ];
            minimize = "@as []";
        };

        "org/gnome/shell/keybindings" = {
            focus-active-notification="@as []";
            toggle-message-tray=["<Super>n"];
        };

        # ----------GNOME EXTENSION SETTINGS-----------------------
        "org/gnome/shell" = {
            enabled-extensions=[
                "drive-menu@gnome-shell-extensions.gcampax.github.com"
                "blur-my-shell@aunetx"
                # "emoji-copy@felipeftn"
                "mediacontrols@cliffniff.github.com"
                "clipboard-history@alexsaveau.dev" 
                "autohide-battery@sitnik.ru" 
                "monitor@astraext.github.io"
                "burn-my-windows@schneegans.github.com" 
                "xwayland-indicator@swsnr.de"
            ];
        };

        "org/gnome/shell/extensions/clipboard-history" = {
            cache-size=435;
            display-mode=1;
            history-size=700;
            private-mode=false;
            toggle-menu=[ "<Super>v" ];
            window-width-percentage=38;
        };

        "org/gnome/shell/extensions/emoji-copy" = {
            always-show=false;
        };

        "org/gnome/shell/extensions/mediacontrols" = {

            # element-order=['menu', 'title', 'controls', 'icon']
            extension-index= mkUint32 2;
            extension-position="Left";
            hide-media-notification=true;
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

        # =====================GUAKE===============================
        # TODO: maybe use guake yml in future
        "org/guake/general" = {
            compat-delete="delete-sequence";
            display-n=0;
            display-tab-names=0;
            gtk-use-system-default-theme=true;
            hide-tabs-if-one-tab=true;
            history-size=1000;
            infinite-history=true;
            #lazy-losefocus=false;
            load-guake-yml=true;
            max-tab-name-length=100;
            mouse-display=true;
            open-tab-cwd=true;
            prompt-on-quit=true;
            quick-open-command-line="code %(file_path)s";
            quick-open-enable=true;
            quick-open-in-current-terminal=false;
            restore-tabs-notify=false;
            restore-tabs-startup=true;
            save-tabs-when-changed=true;
            schema-version="3.10";
            scroll-keystroke=true;
            start-at-login=true;
            startup-script="";
            tab-ontop=false;
            use-default-font=false;
            use-login-shell=true;
            use-popup=false;
            use-scrollbar=false;
            use-trayicon=false;
            window-halignment=0;
            window-height=48;
            window-losefocus=true;
            window-refocus=false;
            window-ontop=false;
            window-tabbar=true;
            window-valignment=1;
            window-vertical-displacement=0;
            window-width=100;

        };
        "org/guake/keybindings/global" = {
            show-hide="F12";
        };

        "org/guake/keybindings/local" = {
            clipboard-copy="<Primary><Shift>c";
            clipboard-paste="<Primary><Shift>v";
            focus-terminal-down="<Shift>Down";
            focus-terminal-left="<Shift>Left";
            focus-terminal-right="<Shift>Right";
            focus-terminal-up="<Shift>Up";
            move-terminal-split-up="disabled";
            search-on-web="disabled";
            split-tab-vertical="<Shift><Super>plus";
        };
        
        "org/guake/style" = {
            cursor-shape = 1;
        };
        "org/guake/style/background" = {
            transparency = 41;
        };
        "org/guake/style/font" = {
            allow-bold=true;
            bold-is-bright=true;
            palette="#222233334444:#aaaa11112222:#3333aaaa1111:#ccccaaaa2222:#22225555cccc:#77775555aaaa:#2222bbbbcccc:#88889999aaaa:#555566667777:#ffff11113333:#3333ffff1111:#ffffdddd3333:#33337777ffff:#aaaa7777ffff:#3333ddddffff:#bbbbccccdddd:#ddddeeeeffff:#070713131717";
            palette-name="Galizur";
            style="Hack Nerd Font Mono 16";
        };
    };
}