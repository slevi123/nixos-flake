_: {
  lib = {
    build-hyprpaper-conf = import ./lib/build-hyprpaper-conf.nix; # {lib = nixpkgs.lib;};
    bring-system = import ./lib/bring-system.nix;
    bring-system-inputs = import ./lib/bring-system-inputs.nix;
  };
}
