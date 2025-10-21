_: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leswell = {
    isNormalUser = true;
    # description = "simofilevi";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "users"
      "plugdev"
      "usb"
      "libvirtd"
      "gitprojects"
    ];
    uid = 1000;
    useDefaultShell = true;

    openssh.authorizedKeys.keys = [

    ];
  };
}
