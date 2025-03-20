{inputs, pkgs, ...}:
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };

  };

  wsl.enable = true;
  wsl.defaultUser = "leswellhm";

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

  programs.zsh.enable = true;

  system.stateVersion = "24.11";
}