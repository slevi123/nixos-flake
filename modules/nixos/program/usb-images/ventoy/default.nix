{ pkgs, ... } : {
  environment.systemPackages = [
    # pkgs.ventoy-full-qt
    pkgs.ventoy-full-gtk
  ];

  nixpkgs.config.permittedInsecurePackages = [
    # "ventoy-qt5-1.1.07"
    "ventoy-gtk3-1.1.07"
  ];
            
}