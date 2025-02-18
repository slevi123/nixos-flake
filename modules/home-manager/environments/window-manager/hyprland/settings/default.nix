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

    ./plugin/hyprexpo.nix
  ];
}