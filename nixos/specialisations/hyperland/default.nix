{pkgs, lib, ...} : {
    specialisation = {
      hyprland.configuration = {
        system.nixos.tags = [ "hyprland" ];

        services = {
          xserver = {
            desktopManager.gnome = {
              enable = lib.mkForce false;
            };
            # windowManager.hypr = {
            #   enable = true;
            # };
          };
          udisks2 = {
            enable = true;
          };
        };

        programs = {
          hyprland = {
            enable = true;
            withUWSM = true;
            xwayland.enable = true;
          };
          # waybar = {
          #   enable = true;
          # }
          hyprlock = {
            enable = true;
          };
        };

        environment.systemPackages = with pkgs; [
          waybar
          kitty
          nautilus
          # fnott  # swaync is just better for now
        ];

        hardware = {
          bluetooth = {
            enable = true;
          };
        };
      };
    };
}
