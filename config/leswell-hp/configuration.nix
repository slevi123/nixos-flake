{ pkgs, ... }:
{
  imports = [
    "/etc/nixos/hardware-configuration.nix"
  ];

  settings = {
      # Enable flakes
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
  };

  # services.desktopManager.gnome = {
  #   enable = true;
  # };

  users.users.leswell-init = {
    isNormalUser = true;
    description= "leswell-init";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [
      pkgs.kitty
      pkgs.git
      pkgs.helix
      # pkgs.vscode
    ];
  };
}