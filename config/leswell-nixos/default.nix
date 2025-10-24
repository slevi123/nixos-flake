{
  withSystem,
  self,
  inputs,
  ...
}:
{

  flake.nixosConfigurations.leswell-nixos = withSystem "x86_64-linux" (
    _ctx@{
      self',
      inputs',
      system,
      ...
    }:
    inputs.nixpkgs.lib.nixosSystem {
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

      modules = [
        "${self}/hosts/parts/comfy.nix"
        "${self}/hosts/leswell-nixos"

        inputs.home-manager.nixosModules.home-manager
        # inputs.hyprland.nixosModules.default
        {
          home-manager = {
            users.leswellhm = ../../homes/leswellhm;

            extraSpecialArgs = {
              inherit self;
              inherit inputs' inputs system;

              stateVersion = "23.05";
            };
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [
              # modules shared between all users
              # "${self}/bits/home-manager/environment/gui/desktop-environment/gnome"
              # (import "${self}/homes/parts/common.nix" (args // { stateVersion = "23.05"; }))
              "${self}/homes/parts/common.nix"
            ];
            backupFileExtension = "hm-backup-g2";
          };
        }
      ];
    }
  );
}
