{ self, pkgs, ... }:
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };

  };

  wsl.enable = true;
  wsl.defaultUser = "leswellhm";

  imports = [
    "${self}/bits/nixos/environment/tty/comphy.nix"

    # "${self}/bits/nixos/users"
    # "${self}/bits/nixos/firewall"

    # "${self}/bits/nixos/packages"
    "${self}/bits/nixos/i18n_i10n"

    "${self}/bits/nixos/agenix"

    # temporary
    # "${self}/bits/nixos/ide/jupyter" # for faculty
  ];

  users.users = {
    leswellhm = {
      description = "initial";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "users"
        "plugdev"
        "usb"
        "network"
      ];
      shell = pkgs.zsh;
    };
    leswell = {
      description = "leswell";
      isNormalUser = true;
      uid = 1002;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "users"
        "plugdev"
        "usb"
      ];
      shell = pkgs.zsh;

    };
  };
}
