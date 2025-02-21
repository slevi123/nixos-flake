{ pkgs, ... } : {
	networking.firewall = {
  	enable = true;
  	allowedTCPPorts = [ 80 443 22 9443 9991 1112 8093 631 ];
		allowedUDPPorts = [ 631 5353 ];
	};
}
