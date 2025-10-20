_: {
  wayland.windowManager.hyprland = {
    settings = {
      gesture = [ "3, horizontal, workspace" ];

      general = {
        gaps_in = 5;
        gaps_out = 15;

        border_size = 2;

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers # it was -1 by default
        disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
      };

      decoration = {
        # rounding = 10;

        # Change transparency of focused and unfocused windows
        # active_opacity = "0.95505050";
        # inactive_opacity = "0.8";

        # shadow = {
        #     enabled = true;
        #     range = 4;
        #     render_power = 3;
        #     color = "rgba(1a1a1aee)";
        # };

        # blur = {
        #     enabled = true;
        #     size = 3;
        #     passes = 1;

        #     vibrancy = "0.1696";
        # };
        rounding = 15;
        rounding_power = 4.0;
        inactive_opacity = 0.54;
        active_opacity = 0.90;
        shadow = {
          enabled = false;
        };
        # drop_shadow = false;

        blur = {
          enabled = true;
          size = 10;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0;
          brightness = 0.90;
        };
      };

      animations = {
        enabled = "yes, please :)";

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
    };

    extraConfig = ''
      general {
        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        # col.active_border = rgba(245, 66, 84, 0.98) rgba(8, 7, 7, 0.83) 45deg
        col.active_border = rgba(F54254FA) rgba(080707D4) 45deg
        # col.inactive_border = rgba(595959aa)
        # col.inactive_border = rgba(128, 122, 122, 0.23) rgba(8, 7, 7, 0.18) 90deg
        col.inactive_border = rgba(807A7A3B) rgba(0807072E) 90deg
      }
    '';
  };
}
