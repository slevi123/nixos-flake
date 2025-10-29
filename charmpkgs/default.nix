{ moduleWithSystem, withSystem, self, inputs, lib, ... }:
{
  flake.charmpkgs = moduleWithSystem (
    _perSystem@{ pkgs, self', inputs', ... }: # NOTE: only explicitly named parameters will be in perSystem; see below
    _nixos: {
      mkCharmOS = import ./charm-os.nix { inherit withSystem self inputs lib self' inputs';};
    }
  );
}