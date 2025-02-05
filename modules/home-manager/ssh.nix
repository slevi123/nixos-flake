{config, ...}: {
  programs.ssh = {
    enable = true;

    # Define SSH hosts
    matchBlocks = {
      # Host: lrpi
      "lrpi" = {
        hostname = "192.168.0.66";
        user = "root";
        identityFile = ["${config.home.homeDirectory}/.ssh/homerpi"];
      };

      # Host: rpi
      "rpi" = {
        hostname = "leswell.crabdance.com";
        port = 99;
        user = "root";
        identityFile = ["${config.home.homeDirectory}/.ssh/homerpi"];
      };

      # Host: pcloc
      "pcloc" = {
        hostname = "192.168.0.109";
        user = "leswell";
      };
    };
  };
}
