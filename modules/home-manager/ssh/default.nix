{ osConfig, ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    # Define SSH hosts
    matchBlocks = {
      # Host: lrpi
      "lrpi" = {
        hostname = "192.168.0.66";
        user = "root";
        identityFile = osConfig.age.secrets.homerpi.path;
      };

      # Host: rpi
      "rpi" = {
        hostname = "leswell.crabdance.com";
        port = 99;
        user = "root";
        identityFile = osConfig.age.secrets.homerpi.path;
      };

      # Host: pcloc
      "pcloc" = {
        hostname = "192.168.0.109";
        user = "leswell";
      };
    };
  };
}
