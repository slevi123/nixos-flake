{ ... }:
{
  home.file.".config/hypr/hypridle.conf" = {
    source = ./hypridle.conf;
    recursive = true;
  };

  home.sessionVariables = {
    CHARM_IDLE = "hypridle";
  };
}
