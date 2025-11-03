# { ... }:
{
  lib = {
    # build-hyprpaper-conf = 
    bring-system = (import ./lib/bring-system.nix);
    bring-system-inputs = (import ./lib/bring-system-inputs.nix);
  };
}