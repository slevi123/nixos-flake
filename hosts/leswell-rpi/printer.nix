{ pkgs, ... } : {
	services = {
    printing = {
      enable = true;
      drivers = [ pkgs.foo2hp ];
      browsing = true;
      listenAddresses = [ "*:631" ];
      allowFrom = [ "all" ];
      defaultShared = true;
      extraConf = ''
        DefaultPaperSize = A4
      '';
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
      allowInterfaces = [ "end0" ];
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };
  };

  hardware.printers = {
    ensurePrinters = [
      {
        name = "HP-LaserJet-6P";
        location = "Home";
        deviceUri = "usb://USB2.0-Print/";
        model = "drv:///sample.drv/laserjet.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];

    ensureDefaultPrinter = "HP-LaserJet-6P";
  };
}
