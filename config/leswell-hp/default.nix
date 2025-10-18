args @ {
  nixpkgs,
  inputs,
  self,
}:
nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs self;
    stateVersion = "25.05";
    hostName = "HyPo";
  };  
  modules = [
    "${self}/hosts/parts/comfy.nix"
    "${self}/hosts/leswell-nixos"

    inputs.home-manager.nixosModules.home-manager
    # inputs.hyprland.nixosModules.default
    {
      home-manager = {
        users.leswellhm = ../../homes/parts/charm-de.nix;

        extraSpecialArgs = {
          inherit inputs self;
          stateVersion = "25.05";
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
