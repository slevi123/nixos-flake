{pkgs, ...}:
{
    networking.firewall = {
      allowedTCPPorts = [
        24800
      ];
    };

    environment.systemPackages = with pkgs; [
      input-leap
    ];
}