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
    inputs.nix-index-database.homeModules.nix-index
    "${self}/modules/home-manager/environment/languages"
    "${self}/modules/home-manager/environment/tty/alpha.nix"
    "${self}/modules/home-manager/environment/web-stack"
    "${self}/modules/home-manager/terminal/kitty"
    "${self}/modules/home-manager/terminal/warp"

    "${self}/modules/home-manager/environment/gui/window-manager/hyprland"
    "${self}/modules/home-manager/environment/gui/bar/waybar"
    "${self}/modules/home-manager/environment/gui/bar/ashell"
    "${self}/modules/home-manager/environment/gui/idle/hypridle"
    "${self}/modules/home-manager/environment/gui/wallpaper/hyprpaper"
    "${self}/modules/home-manager/environment/gui/screen-lock/hyprlock"
    "${self}/modules/home-manager/environment/gui/notification/swaync"
    "${self}/modules/home-manager/environment/gui/menu/wofi"
    "${self}/modules/home-manager/environment/gui/menu/quick-actions"
    "${self}/modules/home-manager/environment/sound/frontend/helvum"
    "${self}/modules/home-manager/environment/sound/frontend/pavucontrol"

    "${self}/modules/home-manager/environment/gui/fonts"

    "${self}/modules/home-manager/program/browser"
    "${self}/modules/home-manager/program/file-manager/yazi.nix"
    "${self}/modules/home-manager/program/file-manager/superfile.nix"
    "${self}/modules/home-manager/program/color-picker/hyprpicker.nix"
    "${self}/modules/home-manager/program/calculator/qalc.nix"
    "${self}/modules/home-manager/program/resource-monitor/btop"
    # "${self}/modules/home-manager/program/ai/anythingllm.nix"
    "${self}/modules/home-manager/program/ai/openai-whisper.nix"
    "${self}/modules/home-manager/program/about/fastfetch"

    "${self}/modules/home-manager/program/communication/discord"
    # "${self}/modules/home-manager/program/communication/matrix/element"
    "${self}/modules/home-manager/program/character-picker/unipicker"
    "${self}/modules/home-manager/program"

    "${self}/modules/home-manager/ide/vscode"
    "${self}/modules/home-manager/ide/nixvim"
    # "${self}/modules/home-manager/ide/jetbrains"

    # TODO: refactor these
    "${self}/modules/home-manager/packages.nix"
    "${self}/modules/home-manager/theme.nix"
    "${self}/modules/home-manager/ssh"
    "${self}/modules/home-manager/networking/iw-frontend"
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
