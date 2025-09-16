{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leswellhm = {
    description = "levi (hm)";
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "users"
      "plugdev"
      "usb"
      "libvirtd"
      "gitprojects"
      "i2c"
      "network"
    ];
  };
}
