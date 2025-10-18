{ pkgs, ... }:
{
  hardware = {
    sensor = {
      iio.enable = true;
    };
  };

  environment.systemPackages = [
    pkgs.iio-sensor-proxy
  ];
}
