_: {
  services = {
    displayManager = {
      # defaultSession = "gnome";
      gdm = {
        enable = true;
        # debug = true;
        wayland = true;
        banner = "Welcome explorer 🤠";
      };
    };
  };
}
