{
  description = "My Own NixOS Config (Leswell)";

  inputs = {
    # nixtheplanet.url = "github:matthewcroughan/nixtheplanet";
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
    # Nixpkgs
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2311.557104.tar.gz";
    old-nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    #home-manager.url = "github:nix-community/home-manager/release-23.05";
    #home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = {
    self,
    nixpkgs,
    #home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Your custom packages
    # Acessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
    );
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};
    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;
    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    #homeManagerModules = import ./modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # TODO replace with your hostname
      leswell-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          {
            environment.systemPackages = [ inputs.fh.packages.x86_64-linux.default ];
          }
          # > Our main nixos configuration file <
          ./nixos/configuration.nix
          ./nixos/vpn.nix
          # ./nixos/virt.nix

          # nixtheplanet.nixosModules.macos-ventura
          # {
          #   services.macos-ventura = {
          #     # enable = true;
          #     openFirewall = true;
          #     vncListenAddr = "0.0.0.0";
          #   };
          # }
        ];
      };
    };

    # # Standalone home-manager configuration entrypoint
    # # Available through 'home-manager --flake .#your-username@your-hostname'
    # homeConfigurations = {
    #   # TODO replace with your username@hostname
    #   "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [
    #       # > Our main home-manager configuration file <
    #       ./home-manager/home.nix
    #     ];
    #   };
    # };
  };
}
