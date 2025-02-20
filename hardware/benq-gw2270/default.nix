{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    ddcutil
  ];
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [ 
      ddcci-driver # testing
    ];
    kernelModules = [ "i2c-dev" "ddcci" ];
  };
}