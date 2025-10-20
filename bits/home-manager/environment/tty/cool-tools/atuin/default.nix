_: {
  programs = {
    atuin = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;

      flags = [
        # "--disable-up-arrow"
        # "--disable-ctrl-r"
      ];

      settings = {
        filter_mode = "session";
        style = "compact";
      };
    };
  };
}
