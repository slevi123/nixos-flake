{pkgs, ...}: {
  services = {
    xserver = {
      displayManager = {
        # defaultSession = "gnome";

        gdm = {
          enable = true;
          # debug = true;\
          wayland = true;
          banner = "Welcome explorer 🤠";
        };
        # lightdm = {
        #     enable = true;

        #     greeter = {
        #         enso = {
        #             enable = true;
        #         };
        #         gtk = {
        #             enable = false;
        #         }
        #     };
        # };
      };
    };
  };
}
