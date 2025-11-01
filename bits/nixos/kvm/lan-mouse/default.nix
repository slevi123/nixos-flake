{ pkgs, ... }:
{
  networking.firewall = {
    allowedUDPPorts = [ 4242 ]; # lan-mouse
  };

  environment.systemPackages = with pkgs; [ lan-mouse ];
}
