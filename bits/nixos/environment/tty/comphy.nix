#
{ ... }:
{
  imports = [
    ./essential.nix

    # --- TUI ---
    # filemanager
    ./cool-tools/yazi

    # My Prompt
    ./starship
  ];

  programs = {

    bat.enable = true;

    # ------TUI------
    lazygit.enable = true;
    # lazydocker.enable = true;
  };

}
