{
  pkgs,
  config,
  ...
}: {
  services = {
    xserver = {
      # enable = true;
      videoDrivers = ["nvidia"];
    };
  };

  hardware = {
    #Prime GPU Bus Ids set by nixos-hardware
    graphics = {
      enable = true;
      extraPackages = with pkgs; [nvidia-vaapi-driver];
    };

    nvidia = {
      open = true; # Set to false for proprietary drivers
      modesetting.enable = true;
      powerManagement.enable = true;


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

  environment.sessionVariables = {
    # MAYBE USEFULL
    # Force Wayland to use the NVIDIA driver
    # GBM_BACKEND = "nvidia-drm";
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";

    # Fallback to Xwayland for X11 apps
    # WLR_NO_HARDWARE_CURSORS = "1"; # Required for Hyprland with NVIDIA
  };
}