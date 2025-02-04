{
  # template used: https://github.com/Misterio77/nix-starter-configs (it is outdated now)
  description = "My Own NixOS Config (Leswell) - Lenovo Gaming 3 laptop";

  inputs = {

    
    # fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2411.713184.tar.gz";
    hardware.url = "https://flakehub.com/f/NixOS/nixos-hardware/0.1.2090.tar.gz";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Bootloader theme
    darkmatter.url = "gitlab:VandalByte/darkmatter-grub-theme";

    

    # package database for `, any_command`
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";

      # disable darwin deps on linux (saves some space)
      # inputs.darwin.follows = "";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    darkmatter,
    nix-index-database,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [ "aarch64-linux" "i686-linux" "x86_64-linux" "aarch64-darwin" "x86_64darwin" ];

    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # custom packages
    # acessible through 'nix build', 'nix shell', etc
    packages = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        import ./pkgs {inherit pkgs;}
    );

    # available through 'nix fmt'
    # other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Your custom packages and modifications, exported as overlays
    overlays = import ./overlays {inherit inputs;};

    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;

    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home-manager;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # TODO replace with your hostname
      leswell-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          {
            # environment.systemPackages = [ inputs.fh.packages.x86_64-linux.default ];
          }
          # > Our main nixos configuration file <
          darkmatter.nixosModule
          ./nixos/configuration.nix
        ];
      };
    };

    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      leswellhm = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          nix-index-database.hmModules.nix-index
          inputs.agenix.homeManagerModules.default
          ./home-manager/home.nix
        ];
      };
    };
  };
}
