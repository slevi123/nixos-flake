{
  self,
  pkgs,
  stateVersion,
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
    "${self}/bitss/nixos/environment/tty/comphy.nix"

    # "${self}/bitss/nixos/users"
    # "${self}/bitss/nixos/firewall"

    # "${self}/bitss/nixos/packages"
    "${self}/bitss/nixos/i18n_i10n"

    "${self}/bitss/nixos/agenix"

    # temporary
    # "${self}/bitss/nixos/ide/jupyter" # for faculty
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
