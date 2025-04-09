{...}:
{
  home.file.".config/hypr/hyprlock.conf" = {
    source = ./hyprlock.conf;
    recursive = true;
  };

  home.sessionVariables = {
    CHARM_SCREENLOCK = "hyprlock";
  };
}
