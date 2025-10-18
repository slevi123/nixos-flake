args@{
  self,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-index-database.homeModules.nix-index
    "${self}/bitss/home-manager/environment/languages"
    "${self}/bitss/home-manager/environment/tty/alpha.nix"
    "${self}/bitss/home-manager/environment/web-stack"
    "${self}/bitss/home-manager/terminal/kitty"
    # "${self}/bitss/home-manager/terminal/warp"

    "${self}/bitss/home-manager/environment/gui/window-manager/hyprland"
    "${self}/bitss/home-manager/environment/gui/bar/waybar"
    # "${self}/bitss/home-manager/environment/gui/bar/ashell"
    "${self}/bitss/home-manager/environment/gui/idle/hypridle"
    "${self}/bitss/home-manager/environment/gui/wallpaper/hyprpaper"
    "${self}/bitss/home-manager/environment/gui/wallpaper/wallrizz"
    "${self}/bitss/home-manager/environment/gui/screen-lock/hyprlock"
    "${self}/bitss/home-manager/environment/gui/notification/swaync"
    "${self}/bitss/home-manager/environment/gui/notification"
    "${self}/bitss/home-manager/environment/gui/menu/wofi"
    "${self}/bitss/home-manager/environment/gui/menu/rofi"
    "${self}/bitss/home-manager/environment/gui/menu/quick-actions"
    "${self}/bitss/home-manager/environment/gui/battery-warning/battery-notify"
    "${self}/bitss/home-manager/environment/gui/recorder/voice/gnome-sound-recorder"
    "${self}/bitss/home-manager/environment/sound/frontend/helvum"
    "${self}/bitss/home-manager/environment/sound/frontend/pavucontrol"
    "${self}/bitss/home-manager/environment/bluetooth"
    "${self}/bitss/home-manager/environment/screenshot/hyprshot"

    "${self}/bitss/home-manager/environment/gui/fonts"
    "${self}/bitss/home-manager/environment/gui/theme"
    "${self}/bitss/home-manager/environment/gui/widget/quickshell"

    "${self}/bitss/home-manager/program/browser"
    "${self}/bitss/home-manager/program/viewer/pdf/zathura"
    "${self}/bitss/home-manager/program/viewer/markdown/glow"
    "${self}/bitss/home-manager/program/file-manager/yazi.nix"
    "${self}/bitss/home-manager/program/file-manager/superfile.nix"
    "${self}/bitss/home-manager/program/color-picker/hyprpicker.nix"
    "${self}/bitss/home-manager/program/calculator/qalc.nix"
    "${self}/bitss/home-manager/program/resource-monitor/btop"
    # "${self}/bitss/home-manager/program/ai/anythingllm.nix"
    "${self}/bitss/home-manager/program/ai/openai-whisper.nix"
    "${self}/bitss/home-manager/program/ai/ocr/tesseract"
    "${self}/bitss/home-manager/program/about/fastfetch"
    # "${self}/bitss/home-manager/program/learning/flash-cards/anki"
    "${self}/bitss/home-manager/program/colors/pastel"

    "${self}/bitss/home-manager/program/communication/discord"
    # "${self}/bitss/home-manager/program/communication/matrix/element"
    "${self}/bitss/home-manager/program/character-picker/unipicker"
    "${self}/bitss/home-manager/program"
    "${self}/bitss/home-manager/games"

    "${self}/bitss/home-manager/ide/vscode"
    "${self}/bitss/home-manager/ide/nixvim"
    # "${self}/bitss/home-manager/ide/jetbrains"

    # TODO: refactor these
    "${self}/bitss/home-manager/packages.nix"
    "${self}/bitss/home-manager/theme.nix"
    "${self}/bitss/home-manager/environment/remote/ssh"
    "${self}/bitss/home-manager/environment/remote/vnc/wayvnc"
    "${self}/bitss/home-manager/networking/iw-frontend"
  ];

  home = {
    homeDirectory = "/home/leswellhm";
    /*
      keyboard = {
         layout = "us,hu+qwerty,ro"; # Define the layouts
         options = "lv3:ralt_switch"; # Set XKB options
       };
    */
  };
}
