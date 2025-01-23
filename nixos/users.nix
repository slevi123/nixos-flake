{pkgs, ...} : {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      leswell = {
        isNormalUser = true;
        # description = "simofilevi";
        extraGroups = [ "networkmanager" "wheel"  "docker" "users" "plugdev" "usb" "libvirtd" "gitprojects" ];
        uid = 1000;
        packages = with pkgs; [
          firefox
        #  thunderbird
        ];
        useDefaultShell = true;

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDrbQaW5MNyS+SOy8D539VHZgiXiLdAd3D9sKnS/dz8L leswell"
        ];
      }; 
      leswellhm = {
        description = "levi (hm)";
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel"  "docker" "users" "plugdev" "usb" "libvirtd" "gitprojects" ];
      };

      # unsafe = {
      #   isNormalUser = true;
      #   description = "account mainly for only films.. not trusted";
      #   packages = with pkgs; [
      #     firefox
      #   ]; 
      # };
    };
    groups = {
      gitprojects = { };
    };
  };
}