# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      <nixos-hardware/lenovo/ideapad/15arh05>
      # <nixos-hardware/common/cpu/amd/pstate.nix>  # If I want to enable the new amd-pstate driver (powersaving)
      ./hardware-configuration.nix
    ];
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "leswell-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    leswell = {
      isNormalUser = true;
      description = "simofilevi";
      extraGroups = [ "networkmanager" "wheel"  "docker" "users" ];
      uid = 1000;
      packages = with pkgs; [
        firefox
      #  thunderbird
      ];
    
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.fonts = with pkgs; [
    aurulent-sans
    nerdfonts
  ];
	
  fonts.enableDefaultFonts = true;

  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany    # web browser
    simple-scan # document scanner

    # baobab      # disk usage analyzer
    # cheese      # photo booth
    # eog         # image viewer
    gedit       # text editor
    # totem       # video player
    # yelp        # help viewer
    # evince      # document viewer
    # file-roller # archive manager
    # geary       # email client
    seahorse    # password manager
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    nerdfonts

  # Search
    # rofi

  # Passwords
    bitwarden
    bitwarden-cli
    
  # Tools  
    wget
    htop
    nvtop
    git
    exa
    bat
    pciutils

  # Terminal
    blackbox-terminal

  # Prompt    
    # starship

  # Notes
    obsidian
    
  # Editors
    vim
    vscode.fhs
    jetbrains.idea-ultimate

  # Languages
    python311
    nodejs_20
    jdk

  # Office Suite
    libreoffice
    hunspell
    hunspellDicts.en-us
    hunspellDicts.hu_HU
    hunspellDicts.ru_RU

  # Customization
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-history
    gnomeExtensions.noannoyance-2

    # gnomeExtensions.pop-shell  # buggy, shortcuts not working
    gnomeExtensions.forge
    
  # Others
    neofetch
    gparted
    # libusb1
    xsel # copy the selected text using X

    # coreutils-prefixed
    # gnomeExtensions.power-profile-switcher
    # gnomeExtensions.power-profile-indicator  # not compatible

    # gnomeExtensions.ideapad
    # gnomeExtensions.ideapad-controls # may try in future

    #gnomeExtensions.thinkpad-battery-threshold  # not this platform
    # gnome.gpaste # not working
    
    # auto-cpufreq # not installing
    # gnomeExtensions.cpufreq

  # TO BE MOVED TO PROJECT NIX-SHELLS
    # graphviz
  ];

  programs.starship.enable = true;
  programs.starship.settings = pkgs.lib.importTOML ./starship.toml;

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
  };

  virtualisation.docker.enable = true;
  # services.power-profiles-daemon.enable = lib.mkForce true;
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    prime = {
      # Make sure to use the correct Bus ID values for your system!
        nvidiaBusId = lib.mkForce "PCI:01:00:0";
        amdgpuBusId = lib.mkForce "PCI:06:00:0";
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
