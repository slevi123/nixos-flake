{ pkgs, ... }:
{
  services.wayvnc = {
    enable = true;
    settings = {
      # autoStart = false;
      address = "0.0.0.0";
      port = 5901;
    };
  };

  # home.packages = [
  #   pkgs.wayvnc
  # ];
}
