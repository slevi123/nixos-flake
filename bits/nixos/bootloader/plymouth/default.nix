{ self, ... }:
{
  boot.plymouth = {
    enable = true;
    theme = "glow";
    logo = "${self}/media/CharmOSLogo/ChatGPT-Image_iter2.png";
    # themePackages = [
    #   pkgs.adi1090x-plymouth-themes
    # ];
  };
}
