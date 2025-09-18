{ pkgs, ... }:
{
  home.packages = [
    pkgs.bluetuith

    pkgs.bluetui
    pkgs.overskride # bluetooth GUI
    # pkgs.blueman # blueman-tray is nteresting

    pkgs.bluez-tools
  ];

  services = {
    mpris-proxy.enable = true; # proxy forwarding Bluetooth MIDI controls via MPRIS2 to control media players
  };
}
