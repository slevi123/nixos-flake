{
  nixpkgs,
  inputs,
  self,
  stateVersion ? "24.11",
  homeStateVersion ? stateVersion
}:
nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs self stateVersion; };
  modules = [
    # nixos modules
    "${self}/hosts/parts/comfy.nix"
    # "${self}/hosts/parts/essentials.nix"

    inputs.home-manager.nixosModules.home-manager
    # inputs.hyprland.nixosModules.default
    {
      home-manager = {
        users.leswell = "${self}/homes/leswell";
        extraSpecialArgs = { inherit inputs self homeStateVersion; };
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [
          # modules shared between all users
          "${self}/modules/home-manager/environment/gui/desktop-environment/gnome"
        ];
        backupFileExtension = "hm-backup";
      };
    }
  ];
}
