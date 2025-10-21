{ pkgs, ... }:
{
  home.packages = [ pkgs.superfile ];

  xdg.desktopEntries = {
    "Superfile" = {
      name = "Superfile";
      exec = "kitty superfile";
      terminal = false;
      type = "Application";
      # Optional settings
      comment = "Launches Superfile in kitty";
      icon = "utilities-terminal"; # Or any other icon
      categories = [ "ConsoleOnly" ];
    };
    # ... other desktop entries ...
  };
}
