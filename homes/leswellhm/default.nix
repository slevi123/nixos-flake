{
  self,
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [ 
    inputs.nix-index-database.hmModules.nix-index
    "${self}/modules/home-manager/environment/languages"
    "${self}/modules/home-manager/environment/tty/alpha.nix"
    "${self}/modules/home-manager/environment/web-stack"
    "${self}/modules/home-manager/terminal/kitty"
    "${self}/modules/home-manager/terminal/warp"

    "${self}/modules/home-manager/environment/gui/window-manager/hyprland"
    "${self}/modules/home-manager/environment/gui/bar/waybar"
    "${self}/modules/home-manager/environment/gui/idle/hypridle"
    "${self}/modules/home-manager/environment/gui/wallpaper/hyprpaper"
    "${self}/modules/home-manager/environment/gui/screen-lock/hyprlock"
    "${self}/modules/home-manager/environment/gui/bar/waybar"
    "${self}/modules/home-manager/environment/gui/notification/swaync"
    "${self}/modules/home-manager/environment/gui/menu/wofi"

    "${self}/modules/home-manager/environment/gui/fonts"

    "${self}/modules/home-manager/program/browser"

    "${self}/modules/home-manager/program/communication/discord"
    # "${self}/modules/home-manager/program/communication/matrix/element"
    "${self}/modules/home-manager/program"

    "${self}/modules/home-manager/ide/vscode"
    "${self}/modules/home-manager/ide/nixvim"
    "${self}/modules/home-manager/ide/jetbrains"

    # TODO: refactor these
    "${self}/modules/home-manager/packages.nix"
    "${self}/modules/home-manager/theme.nix"
    "${self}/modules/home-manager/ssh"
  ];
  

  home = {
    homeDirectory = "/home/leswellhm";

/*     keyboard = {
      layout = "us,hu+qwerty,ro"; # Define the layouts
      options = "lv3:ralt_switch"; # Set XKB options
    }; */

    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
