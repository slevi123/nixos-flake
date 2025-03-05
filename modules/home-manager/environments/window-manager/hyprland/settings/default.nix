{...}:
{
  imports = [
    ./monitors.nix
    ./input.nix
    ./startup.nix
    ./env.nix
    ./keybindings
    ./layouts.nix
    ./look-and-feel.nix
    ./windowrules
    ./others.nix

    ./program/clipse.nix
    ./program/obsidian.nix
    ./program/spotify.nix
    ./program/discord.nix
    ./program/ulauncher.nix
    ./program/wofi
    ./program/wofi/bluetuith.nix
    ./program/overskride

    ./plugin/hyprexpo.nix
  ];
}