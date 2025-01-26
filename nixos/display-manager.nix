{pkgs, ...} : {
    services = {
        xserver = { 
            displayManager = {
                # defaultSession = "gnome";

                gdm = {
                    enable = true;
                    # debug = true;\
                    wayland = true;
                    banner = "heyhoo";
                };
            };
        };
    };
}