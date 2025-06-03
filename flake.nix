{
  # template used: https://github.com/Misterio77/nix-starter-configs (it is outdated now) [IN THE PROCESS OF REFACTORING TO MY FLAVOR]
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
        overlays = import ./overlays {inherit inputs;};

        # NixOS configuration entrypoint
        # Available through 'nixos-rebuild --flake .#your-hostname'
        nixosConfigurations = {
          leswell-nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs self; };
            modules = [
              "${self}/hosts/leswell-nixos"

              inputs.home-manager.nixosModules.home-manager
              # inputs.hyprland.nixosModules.default
              {
                home-manager = {
                    users.leswellhm = ./homes/leswellhm;
                    extraSpecialArgs = {inherit inputs self;};
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    sharedModules = [
                      # modules shared between all users
                      ./modules/home-manager/environment/gui/desktop-environment/gnome
                    ];
                    backupFileExtension = "hm-backup"; 
                };
              }
            ];
          };
          leswell-wsl = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {inherit inputs self; };
            modules = [
              inputs.nixos-wsl.nixosModules.default
              inputs.home-manager.nixosModules.home-manager
              "${self}/hosts/leswell-wsl"

               {
                home-manager = {
                    users.leswell = ./homes/leswell-wsl;
                    users.leswellhm = ./homes/leswell-wsl;
                    extraSpecialArgs = {inherit inputs self;};
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    sharedModules = [
                      # modules shared between all users
                    ];
                    backupFileExtension = "hm-backup"; 
                };
              }
            ];
          };
        };
      };

      perSystem = {pkgs, system, ...}: {
        # available through 'nix fmt'
        formatter = pkgs.alejandra;

        # custom packages
        # acessible through 'nix build', 'nix shell', etc
        packages = {
          nixvim = inputs.nixvim.legacyPackages."${system}".makeNixvim (import "${self}/modules/home-manager/ide/nixvim/nixvim-full.nix" {inherit pkgs inputs;} );
        } // import ./pkgs {inherit pkgs;};
      };

      systems = ["aarch64-linux" "i686-linux" "x86_64-linux" "aarch64-darwin" "x86_64-darwin"];
    });

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    # fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    # nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.
    hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      # url = "github:nix-community/home-manager/release-24.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Bootloader theme
    darkmatter.url = "gitlab:VandalByte/darkmatter-grub-theme";

    # package database for `, any_command`
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";

      # disable darwin deps on linux (saves some space)
      # inputs.darwin.follows = "";
    };
    
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    awesome-neovim-plugins.url = "github:m15a/flake-awesome-neovim-plugins";

    keylightctl = {
      url = "git+https://gitlab.com/leswell/keylightctl";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    # niri = {
    #   url = "github:sodiboo/niri-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprland = {
    #   url = "github:hyprwm/Hyprland?ref=refs/tags/v0.45.0";
    # };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    hyprspace = {
      url = "github:KZDKM/Hyprspace";

      # # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
      # inputs.hyprland.follows = "hyprland";
    };
    # ====might-be-useful====
    # nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    # open-vsx.ankitpati.extname
    # vscode-marketplace.extname
  };

}
