{
  pkgs,
  config,
  lib,
  ...
}: {
   system.nixos.tags = lib.mkIf config.programs.hyprland.enable [ "hyprland" ];

  services = {
    xserver = {
      enable = false; 
      desktopManager.gnome = {
        enable = lib.mkForce false;
      };
    };
    udisks2 = {
      enable = true;
    };
  };

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    # waybar = {
    #   enable = true;
    # }
    hyprlock = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    waybar
    kitty
    nautilus
    # fnott  # swaync is just better for now
  ];

  hardware = {
    bluetooth = {
      enable = true;
    };
  };
}
