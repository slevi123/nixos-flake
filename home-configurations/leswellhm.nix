{ self, inputs, ezModules, ... }:
{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ezModules.hyprland-dynamic-config

    inputs.nix-index-database.homeModules.nix-index
    "${self}/bits/home-manager/environment/languages"
    "${self}/bits/home-manager/environment/tty/alpha.nix"
    "${self}/bits/home-manager/environment/web-stack"
    "${self}/bits/home-manager/terminal/kitty"
    # "${self}/bits/home-manager/terminal/warp"

    "${self}/bits/home-manager/environment/gui/window-manager/hyprland"
    "${self}/bits/home-manager/environment/gui/bar/waybar"
    # "${self}/bits/home-manager/environment/gui/bar/ashell"
    "${self}/bits/home-manager/environment/gui/idle/hypridle"
    "${self}/bits/home-manager/environment/gui/wallpaper/hyprpaper"
    "${self}/bits/home-manager/environment/gui/wallpaper/wallrizz"
    "${self}/bits/home-manager/environment/gui/screen-lock/hyprlock"
    "${self}/bits/home-manager/environment/gui/notification/swaync"
    "${self}/bits/home-manager/environment/gui/notification"
    "${self}/bits/home-manager/environment/gui/menu/wofi"
    "${self}/bits/home-manager/environment/gui/menu/rofi"
    "${self}/bits/home-manager/environment/gui/menu/quick-actions"
    "${self}/bits/home-manager/environment/gui/battery-warning/battery-notify"
    "${self}/bits/home-manager/environment/gui/recorder/voice/gnome-sound-recorder"
    "${self}/bits/home-manager/environment/sound/frontend/helvum"
    "${self}/bits/home-manager/environment/sound/frontend/pavucontrol"
    "${self}/bits/home-manager/environment/bluetooth"
    "${self}/bits/home-manager/environment/screenshot/hyprshot"

    "${self}/bits/home-manager/environment/gui/fonts"
    "${self}/bits/home-manager/environment/gui/theme"
    # "${self}/bits/home-manager/environment/gui/widget/quickshell"

    "${self}/bits/home-manager/program/browser"
    "${self}/bits/home-manager/program/viewer/pdf/zathura"
    "${self}/bits/home-manager/program/viewer/markdown/glow"
    "${self}/bits/home-manager/program/file-manager/yazi.nix"
    "${self}/bits/home-manager/program/file-manager/superfile.nix"
    "${self}/bits/home-manager/program/color-picker/hyprpicker.nix"
    "${self}/bits/home-manager/program/calculator/qalc.nix"
    "${self}/bits/home-manager/program/resource-monitor/btop"
    # "${self}/bits/home-manager/program/ai/anythingllm.nix"
    "${self}/bits/home-manager/program/ai/openai-whisper.nix"
    "${self}/bits/home-manager/program/ai/ocr/tesseract"
    "${self}/bits/home-manager/program/about/fastfetch"
    # "${self}/bits/home-manager/program/learning/flash-cards/anki"
    "${self}/bits/home-manager/program/colors/pastel"

    "${self}/bits/home-manager/program/communication/discord"
    # "${self}/bits/home-manager/program/communication/matrix/element"
    "${self}/bits/home-manager/program/character-picker/unipicker"
    "${self}/bits/home-manager/program"
    # "${self}/bits/home-manager/games"

    "${self}/bits/home-manager/ide/vscode"
    "${self}/bits/home-manager/ide/nixvim"
    # "${self}/bits/home-manager/ide/jetbrains"

    # TODO: refactor these
    "${self}/bits/home-manager/packages.nix"
    "${self}/bits/home-manager/theme.nix"
    "${self}/bits/home-manager/environment/remote/ssh"
    "${self}/bits/home-manager/environment/remote/vnc/wayvnc"
    "${self}/bits/home-manager/networking/iw-frontend"
  ];

  home = {
    # homeDirectory = "/home/leswellhm";
    /*
      keyboard = {
         layout = "us,hu+qwerty,ro"; # Define the layouts
         options = "lv3:ralt_switch"; # Set XKB options
       };
    */
  };
}
