# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  self,
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      self.overlays.additions
      self.overlays.modifications

    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  networking = {
    hostName = "leswell-nixos";
    networkmanager.enable = true;

    networkmanager.wifi.powersave = false; # maybe it not letting the laptop to sleep
  };

  systemd.user.services = {
    ulauncher = {
      enable = true;
      description = "Linux Application Launcher";
      documentation = ["https://ulauncher.io/"];
      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = "3s";
        ExecStart = ''
          ${pkgs.bash}/bin/bash -c "export GDK_BACKEND=wayland && export PATH=\"$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin/\" && exec ${pkgs.ulauncher}/bin/ulauncher --hide-window"
        '';
      };

      wantedBy = ["graphical-session.target"];
      after = ["display-manager.service"];
    };
    # albert = {
    #   description = "Linux Application Launcher";
    #   documentation = [ "https://albertlauncher.github.io/" ];

    #   serviceConfig = {
    #     Type = "simple";
    #     Restart = "on-success";
    #     RestartSec = "3s";
    #     ExecStart =  ''
    #       ${pkgs.bash}/bin/bash -c "export PATH=\"$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin/\" && exec ${pkgs.albert}/bin/albert"
    #     '';
    #   };

    #   wantedBy = [ "graphical-session.target" ];
    # };
  };

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "hu_HU.UTF-8";
      LC_IDENTIFICATION = "hu_HU.UTF-8";
      LC_MEASUREMENT = "hu_HU.UTF-8";
      LC_MONETARY = "hu_HU.UTF-8";
      LC_NAME = "hu_HU.UTF-8";
      LC_NUMERIC = "hu_HU.UTF-8";
      LC_PAPER = "hu_HU.UTF-8";
      LC_TELEPHONE = "hu_HU.UTF-8";
      LC_TIME = "hu_HU.UTF-8";
    };
  };

  security = {
    rtkit.enable = true;
  };

  services = {
    # Enable the X11 windowing system.
    xserver = {
      # enable = true;
      videoDrivers = ["nvidia"];
    };

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    flatpak.enable = true;
  };

  hardware = {
    firmware = [pkgs.linux-firmware];
  };

  fonts = {
    packages = with pkgs; [
      aurulent-sans
      nerdfonts
    ];
    enableDefaultPackages = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = import ./packages/stable.nix {pkgs = pkgs;} ++ import ./packages/unstable.nix {pkgs = pkgs.unstable;};
  # ++ [ pkgs.other.chromium pkgs.other.chromedriver pkgs.new-pkgs.gnomeExtensions.gemini-ai ];
  # ++ import ../package_lists/cuda.nix { pkgs = cudaPackages; };

  # nixpkgs.config.permittedInsecurePackages = [
  #               "electron-25.9.0"
  #             ];

  environment = {
    variables = {
      FFF_CD_ON_EXIT = "1";
    };
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
    };

    zsh = {
      enable = true;
      autosuggestions.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      zsh-autoenv.enable = true;

      shellInit = "eval \"$(zoxide init zsh)\"";
    };

    bash = {
      shellInit = "eval \"$(zoxide init bash)\"";
    };
  };

  virtualisation.docker = {
    enable = true;
    # enableNvidia = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
