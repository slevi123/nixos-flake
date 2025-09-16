{ pkgs, ... }:
{
  networking = {
    networkmanager = {
      wifi.backend = "iwd";
    };

    wireless = {
      iwd = {
        enable = true;
        settings = {
          # Settings.AutoConnect = true;
          # Network.EnableIPv6 = true;
        };
      };
    };

    # # Use systemd-networkd for basic network configuration
    # useNetworkd = true;

    # # Configure DHCP client (dhcpcd is a good alternative)
    # dhcpcd.enable = true;

  };
  # # Enable DNS resolution
  # services.resolved.enable = true;

  # # Use systemd-networkd for basic network configuration
  # systemd.network.enable = true;
}
