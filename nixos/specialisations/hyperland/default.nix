{pkgs, lib, ...} : {
    specialisation = {
      hyprland.configuration = {
        system.nixos.tags = [ "hyprland" ];

        services.xserver = {
          desktopManager.gnome = {
            enable = lib.mkForce false;
          };

          # windowManager.hypr = {
          #   enable = true;
          # };
        };

        programs.hyprland = {
          enable = true;
          withUWSM = true;
          xwayland.enable = true;
        };

        environment.systemPackages = with pkgs; [
          kitty
          nautilus
        ];
      };
    };
}