{pkgs, ...} : {
    networking.firewall = {
      allowedTCPPorts = [ 
        1968
        8691
        4723  # appium
        5037  # appium
        5173  # frontend
        2022
        8080  # backend
      ];

      # allowedTCPPortRanges = [
      #  {from = 1716; to=1764;} # for gsconnect 
      # ];

      # allowedUDPPortRanges = [ 
      #   {from = 1716; to=1764;} # for gsconnect
      # ];
    };
}