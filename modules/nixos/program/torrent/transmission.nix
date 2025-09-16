{ pkgs, ... }:
{
  services.transmission.enable = true;
  environment.systemPackages = [
    pkgs.transmission_4-gtk
    pkgs.transmission_4-qt
  ];
}
