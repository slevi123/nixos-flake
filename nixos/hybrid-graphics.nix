{pkgs, config, ...} : {
    hardware = {
        #Prime GPU Bus Ids set by nixos-hardware
        graphics = {
            enable = true;
            extraPackages = with pkgs; [ nvidia-vaapi-driver ];
        };

    nvidia = {
        open = false; # Set to false for proprietary drivers
        modesetting.enable = true;
        
        # prime = {
        #   # allowExternalGpu = true;
        #   offload = {
        #     enable = false;
        #   };
        #   sync = {
        #     enable = true;
        #   };
        # };
        #prime = {
        #  offload = {
        #  };
        #  sync = {
        #    enable = true;
        #  };
        #};

        nvidiaSettings = true;

        package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
    };

    # specialisation = {
    #   on-the-go.configuration = {
    #     system.nixos.tags = [ "on-the-go" ];
    #     hardware = {
    #       nvidia = {
    #         prime = {
    #           offload = {
    #             enable = lib.mkForce true;
    #           };
    #           sync = {
    #             enable = lib.mkForce false;
    #           };
    #         };
    #       };
    #     };
    #   };
    # };
}