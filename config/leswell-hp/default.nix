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
    efiSupport = false;

    nixos-users = {
      imports = [

          # ./unsafe.nix
        ];
    };
  };  
  modules = [
    "${self}/hosts/parts/comfy.nix"
    "${self}/hosts/parts/charm-de.nix"
    "/etc/nixos/hardware-configuration.nix"
    # inputs.home-manager.nixosModules.home-manager


    "${self}/bits/nixos/users/groups.nix"
    "${self}/bits/nixos/users/leswellhm.nix"
    # inputs.hyprland.nixosModules.default
    # {
    #   home-manager = {
    #     users.leswellhm = ../../homes/parts/charm-de.nix;

    #     extraSpecialArgs = {
    #       inherit inputs self;
    #       stateVersion = "25.05";
    #     };
    #     useGlobalPkgs = true;
    #     useUserPackages = true;
    #     sharedModules = [
    #       # modules shared between all users
    #       # "${self}/bits/home-manager/environment/gui/desktop-environment/gnome"
    #       # (import "${self}/homes/parts/common.nix" (args // { stateVersion = "23.05"; }))
    #       "${self}/homes/parts/common.nix"
    #     ];
    #     backupFileExtension = "hm-backup-g2";
    #   };
    # }
  ];
}
