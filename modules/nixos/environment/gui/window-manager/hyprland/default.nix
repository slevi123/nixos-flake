{
  pkgs,
  config,
  lib,
  inputs,
  system,
  ...
}:
{
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  services = {
    xserver = {
      enable = false;
      # desktopManager.gnome = {
      #   enable = lib.mkForce false;
      # };
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
      # package = inputs.nixpkgs-stable.legacyPackages."${system}".hyprlock;
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
