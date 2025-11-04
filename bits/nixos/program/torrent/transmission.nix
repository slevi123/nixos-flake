{ pkgs, ... }:
{
  services.transmission = {
    enable = true;
    package = pkgs.transmission_4;
  };
  environment.systemPackages = [
    pkgs.transmission_4-gtk
    pkgs.transmission_4-qt
  ];
}
