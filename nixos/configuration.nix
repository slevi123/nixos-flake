# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd
    inputs.hardware.nixosModules.lenovo-ideapad-15arh05

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.other-packages
      outputs.overlays.new-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
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
      # Deduplicate and optimize nix store
      auto-optimise-store = false;
    };
  };

  # FIXME: Add the rest of your current configuration

  networking = {
    # TODO: Set your hostname
    hostName = "leswell-nixos";
    networkmanager.enable = true;

    # Open ports in the firewall.
    firewall = {
      allowedTCPPorts = [ 
        1968
        8691
        4723  # appium
        5037  # appium
        5173  # frontend
        2022
        8080  # backend
      ];

      # allowedTCPPortRanges = [
      #  {from = 1716; to=1764;} # for gsconnect 
      # ];

      # allowedUDPPortRanges = [ 
      #   {from = 1716; to=1764;} # for gsconnect
      # ];
    };


    # Configure network proxy if necessary
    # proxy = {
      # networking.proxy.default = "http://user:password@proxy:port/";
      # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };

  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  # TODO: This is just an example, be sure to use whatever bootloader you prefer
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.darkmatter-theme = {
    enable = true;
    style = "nixos";
  };
  
  boot.kernel.sysctl = { "vm.swappiness" = 10;};

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

   # Enable networking

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome = {
    enable = true;
    # extraGSettingsOverrides = ''
    #   # disable capslock
    #   [org.gnome.desktop.input-sources]
    #   xkb-options ['caps:none']
    # '';
  };

  # services.keyd = {
  #   enab
  # }

  # Configure keymap in X11
  # services.xserver = {
    # layout = "us";
    # xkbVariant = "";
  # };

  services.power-profiles-daemon.enable = false;
  services.tlp.enable = false; 
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  boot.kernel.sysctl."kernel.sysrq" = 80;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users = {
    leswell = {
      isNormalUser = true;
      description = "simofilevi";
      extraGroups = [ "networkmanager" "wheel"  "docker" "users" "plugdev" "usb" "libvirtd" ];
      uid = 1000;
      packages = with pkgs; [
        firefox
      #  thunderbird
      ];
      useDefaultShell = true;

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDrbQaW5MNyS+SOy8D539VHZgiXiLdAd3D9sKnS/dz8L leswell"
      ];
    }; 

    unsafe = {
      isNormalUser = true;
      description = "account mainly for only films.. not trusted";
      packages = with pkgs; [
        firefox
      ]; 
    };
  };

  fonts.packages = with pkgs; [
    aurulent-sans
    nerdfonts
  ];

  fonts.enableDefaultPackages = true;

  environment.gnome.excludePackages = with pkgs.gnome; [
    # epiphany    # web browser
    simple-scan # document scanner

    # baobab      # disk usage analyzer
    # cheese      # photo booth
    # eog         # image viewer
    # gedit       # text editor
    # totem       # video player
    # yelp        # help viewer
    # evince      # document viewer
    # file-roller # archive manager
    # geary       # email client
    # seahorse    # password manager
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = import ../package_lists/stable.nix { pkgs = pkgs; } ++ import ../package_lists/unstable.nix { pkgs = pkgs.unstable; } ; 
  # ++ [ pkgs.other.chromium pkgs.other.chromedriver pkgs.new-pkgs.gnomeExtensions.gemini-ai ];
  # ++ import ../package_lists/cuda.nix { pkgs = cudaPackages; };


  nixpkgs.config.permittedInsecurePackages = [
                "electron-25.9.0"
              ];


  environment.shellAliases = {
    exa = "eza --icons";
    ls = "eza --icons";
    lstree = "exa --tree";
    ll = "exa -l";
    la = "exa -a";
    lla = "exa -la";
    py = "/run/current-system/sw/bin/python -q";
    # z = "zoxide";
    keylight ="py " + toString (../. +"/related_projects/lenovo-ideapad-legion-keyboard-led/keylight.py");
  };

  environment.variables = {
    PYTHONSTARTUP = ../. + "/python_startup.py";
    FFF_CD_ON_EXIT = "1";
  };

  services.flatpak.enable = true;
  programs.starship.enable = true;
  programs.starship.settings = pkgs.lib.importTOML ../starship.toml;

  programs.direnv.enable = true;


  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
  };

  virtualisation.docker = {
    enable = true;
    # enableNvidia = true;
  };

  hardware.nvidia = {
    prime = {
      # Make sure to use the correct Bus ID values for your system!
        # nvidiaBusId = lib.mkForce "PCI:1:0:0";
        amdgpuBusId = lib.mkForce "PCI:6:0:0";
    };

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Enable the Nvidia settings menu,
	  # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  programs = {
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





  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = { 
    enable = true;

    # require public key authentication for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };


   services.udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="048d", ATTR{idProduct}=="c966", MODE="0666"
      SUBSYSTEM=="usb", ATTR{idVendor}=="048d", ATTR{idProduct}=="c963", MODE="0666"
      SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"
  '';

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
