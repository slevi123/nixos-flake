{
  nixpkgs,
  inputs,
  self,
}:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = {
    inherit inputs self;
    stateVersion = "24.11";
  };
  modules = [
    "${self}/hosts/parts/comfy.nix"
    "${self}/hosts/leswell-wsl"

    inputs.nixos-wsl.nixosModules.default
    inputs.home-manager.nixosModules.home-manager

    {
      home-manager = {
        # users.leswell = "${self}/homes/leswell-wsl";
        users.leswellhm = "${self}/homes/leswell-wsl";
        extraSpecialArgs = {
          inherit inputs self;
          stateVersion = "24.11";
        };
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [
          # modules shared between all users
        ];
        backupFileExtension = "hm-backup";
      };
    }
  ];
}
