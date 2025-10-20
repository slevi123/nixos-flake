{
  # template used: https://github.com/Misterio77/nix-starter-configs (it is outdated now) [IN THE PROCESS OF REFACTORING TO MY FLAVOR]
  description = "My Own NixOS Config (Leswell) - Lenovo Gaming 3 laptop";

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      ...
    }:
    let
      supportedSystems = [
        "aarch64-linux"
        # "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];

      flake = {
        overlays = import ./overlays { inherit inputs; };

        utils = nixpkgs.lib.genAttrs supportedSystems (import ./utility { inherit inputs; });
        # NixOS configuration entrypoint
        # Available through 'nixos-rebuild --flake .#your-hostname'
        nixosConfigurations = {
          leswell-nixos = import ./config/leswell-nixos {
            inherit nixpkgs;
            inherit self;
            inherit inputs;
          };
          # leswell-wsl = import ./config/leswell-wsl {
          #   inherit nixpkgs;
          #   inherit self;
          #   inherit inputs;
          # };
          # leswell-minimal = import ./config/minimal {
          #   inherit nixpkgs;
          #   inherit self;
          #   inherit inputs;
          # };
          leswellhp = import ./config/leswell-hp {
            inherit nixpkgs;
            inherit self;
            inherit inputs;
          };
        };
      };

      perSystem =
        { pkgs, system, ... }:
        let
          treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./formatter/treefmt;
        in
        {
          # available through 'nix fmt'
          formatter = treefmtEval.config.build.wrapper;
          # formatter = pkgs.alejandra;

          checks.style = treefmtEval.config.build.check self;

          # custom packages
          # acessible through 'nix build', 'nix shell', etc
          packages = {
            nixvim = inputs.nixvim.legacyPackages."${system}".makeNixvim (
              import "${self}/bits/home-manager/ide/nixvim/nixvim-full.nix" { inherit pkgs inputs; }
            );
          }
          // import ./pkgs { inherit pkgs; };
        };

      systems = supportedSystems;
    };

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    # fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-stable-unfree.url = "github:Abdillah/nixpkgs-unfree/nixos-25.05";
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
      url = "github:nix-community/nixvim/nixos-25.05";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    awesome-neovim-plugins.url = "github:m15a/flake-awesome-neovim-plugins";

    keylightctl = {
      url = "git+https://gitlab.com/leswell/keylightctl";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quick-actions = {
      url = "git+https://gitlab.com/leswell/quick-actions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # niri = {
    #   url = "github:sodiboo/niri-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprland = {
    #   # url = "github:hyprwm/Hyprland?ref=refs/tags/v0.45.0";
    #   url = "github:hyprwm/Hyprland?ref=refs/tags/v0.49.0";
    #   # url = "github:hyprwm/Hyprland/nix";
    # };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      # url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # hyprspace = {
    #   url = "github:KZDKM/Hyprspace";
    #   # # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
    #   # inputs.hyprland.follows = "hyprland";
    # };

    # hyprland-easymotion = {
    #   url = "github:zakk4223/hyprland-easymotion";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.hyprland.follows = "hyprland";
    # };

    # hypr-dynamic-cursors = {
    #   url = "github:VirtCode/hypr-dynamic-cursors";
    #   # inputs.hyprland.follows = "hyprland"; # to make sure that the plugin is built for the correct version of hyprland
    # };

    hyprland-easymotion = {
      url = "github:zakk4223/hyprland-easymotion";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.nixpkgs.follows = "nixpkgs-stable-unfree";
    };

    nix4vscode = {
      url = "github:nix-community/nix4vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ashell.url = "github:MalpenZibo/ashell";
    # open-vsx.ankitpati.extname
    # vscode-marketplace.extname

    quickshell = {
      # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell?ref=refs/tags/v0.2.0";

      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kmonad = {
      url = "github:kmonad/kmonad?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-snapd = {
      url = "github:nix-community/nix-snapd";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix.url = "github:numtide/treefmt-nix";

    # naersk.url = "github:nix-community/naersk"; # rusk crates from crates.io, I guess
  };

}
