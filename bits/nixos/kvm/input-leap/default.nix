{ pkgs, ... }:
{
  networking.firewall = {
    allowedTCPPorts = [ 24800 ]; # input-leap
  };

  environment.systemPackages = with pkgs; [ input-leap ];
}
