{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ddcutil
  ];
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      ddcci-driver # testing
    ];
    kernelModules = [
      "i2c-dev"
      "ddcci"
    ];
  };

  services.udev.packages = [
    (pkgs.writeTextDir "/etc/udev/rules.d/90-i2c.rules" ''
      KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
    '')
  ];
}
