{
  withSystem,
  self',
  inputs,
  lib,
  self,
  pkgs,
  system,
  ...
}: charisma: charm-list:
let
  inputs' = (import "${self}/charmpkgs/lib/bring-system-inputs.nix" pkgs.system inputs);
  transform = list:
  let
    _charm = lib.zipAttrsWith (name: values: values) list;
    _charm-homes = lib.zipAttrsWith (name: values: values) _charm.homes;
    charm = { inherit (_charm) system; homes = _charm-homes; };
  in charm;
  
  charm = transform charm-list;
in

lib.nixosSystem {
  specialArgs = {
    # FIXME remove these, it is good enough foir transition
    inherit
      self
      inputs
      inputs'
      self'
      ;

  }
  // import ./charisma.nix;

  modules = 
    charm.system ++
    [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          users = builtins.imap (name: value: { name={imports = value;}; })
            charm.homes;

          extraSpecialArgs = {
            inherit self inputs' inputs system;

            stateVersion = "23.05";
          };
          useGlobalPkgs = true;
          useUserPackages = true;
          sharedModules = [
            # modules shared between all users
          ];
          backupFileExtension = "hm-backup-g2";
        };
      }
    ];
}
