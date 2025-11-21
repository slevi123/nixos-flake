{ pkgs, ... }: {
  environment.systemPackages = [ 
    pkgs.ifuse
    pkgs.libimobiledevice
  ];

  services.usbmuxd = {
    enable = true;
  };

  programs.fuse = {
    userAllowOther = true;
  };
}
