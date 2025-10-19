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
    # charm-os.tui-ide.enable = true; # FIXME: mv HERE 1
    
    lazygit.enable = true;
    # lazydocker.enable = true;
  };

}
