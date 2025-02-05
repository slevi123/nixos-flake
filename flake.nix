{
  # template used: https://github.com/Misterio77/nix-starter-configs (it is outdated now)
  description = "My Own NixOS Config (Leswell) - Lenovo Gaming 3 laptop";

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    flake-parts,
    darkmatter,
    nix-index-database,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs; } (let outputs = self; in {
      imports = [
      ];

      flake = {
        # Your custom packages and modifications, exported as overlays
        overlays = import ./overlays {inherit inputs;};

        # Reusable home-manager modules you might want to export
        # These are usually stuff you would upstream into home-manager

        # NixOS configuration entrypoint
        # Available through 'nixos-rebuild --flake .#your-hostname'
        nixosConfigurations = {
          leswell-nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs outputs; };
            modules = [
              {
                # environment.systemPackages = [ inputs.fh.packages.x86_64-linux.default ];
              }
              # > Our main nixos configuration file <
              darkmatter.nixosModule
              inputs.hardware.nixosModules.lenovo-ideapad-15ach6
              ./modules/nixos
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
              ./modules/home-manager
              ./home-manager/home.nix
            ];
          };
        };
      };

      perSystem = {pkgs, ...}: {
        # available through 'nix fmt'
        # other options beside 'alejandra' include 'nixpkgs-fmt'
        formatter = pkgs.alejandra;

        # custom packages
        # acessible through 'nix build', 'nix shell', etc
        packages = import ./pkgs {inherit pkgs;};
      };

      systems = ["aarch64-linux" "i686-linux" "x86_64-linux" "aarch64-darwin" "x86_64-darwin"];
    });

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    # fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2411.713184.tar.gz";
    hardware.url = "https://flakehub.com/f/NixOS/nixos-hardware/0.1.2090.tar.gz";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

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
}
