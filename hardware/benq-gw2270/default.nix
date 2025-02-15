{...}:
{
  environment.systemPackages = [
    ddcutil
  ];
  boot.kernelPackages = with config.boot.kernelPackages; [ 
    dccci-driver # testing
    i2c-dev
  ];
}