{
  programs = {
    typos.enable = true;
  };

  settings.formatter = {
    typos = {
      priority = 4;
      configFile = "typos.toml";
    };
  };
}
// import ./common.nix
