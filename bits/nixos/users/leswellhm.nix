_: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leswellhm = {
    isNormalUser = true;
    description = "backup user";
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
      "nixxers"
    ];
  };
}
