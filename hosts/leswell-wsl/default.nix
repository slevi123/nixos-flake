{
  self,
  inputs,
  pkgs,
  ...
}:
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };

  };

  wsl.enable = true;
  wsl.defaultUser = "leswellhm";

    imports = [
    "${self}/modules/nixos/environment/tty/phi.nix"

    # "${self}/modules/nixos/users"
    # "${self}/modules/nixos/firewall"

    # "${self}/modules/nixos/packages"
    "${self}/modules/nixos/i18n_i10n"


    "${self}/modules/nixos/agenix"

    # temporary
    # "${self}/modules/nixos/ide/jupyter" # for faculty
  ];

  users.users = {
    leswellhm = {
      description = "initial";
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel" "docker" "users" "plugdev" "usb"];
      shell = pkgs.zsh;
    };
    leswell = {
      description = "leswell";
      isNormalUser = true;
      uid = 1002;
      extraGroups = ["networkmanager" "wheel" "docker" "users" "plugdev" "usb"];
      shell = pkgs.zsh;

    };
  };

  system.stateVersion = "24.11";
}