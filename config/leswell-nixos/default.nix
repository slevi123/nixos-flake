{ withSystem, self, inputs, ... }:
{

  flake.nixosConfigurations.leswell-nixos = withSystem "x86_64-linux" (_ctx@{ config, inputs', self', ... }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs self;
        stateVersion = "23.05";
        hostName = "leswell-nixos";
        efiSupport = true;
        flake-path = "/nix_config/my_own_nix_config";
        # FIXME remove these, it is good enough foir transition
        packages = self'.packages;

      };
      

      modules = [
        "${self}/hosts/parts/comfy.nix"
        "${self}/hosts/leswell-nixos"

        inputs.home-manager.nixosModules.home-manager
        # inputs.hyprland.nixosModules.default
        {
          home-manager = {
            users.leswellhm = ../../homes/leswellhm;

            extraSpecialArgs = {
              inherit inputs self;
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
