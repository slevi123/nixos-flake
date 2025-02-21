{pkgs, ...}:
{
  imports = [
    ./shell.nix
    ./ssh.nix
    ./cron.nix
    ./firewall.nix
    ./vpn.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = ["xhci_pci" "usbhid" "usb_storage"];
  };
  loader = {
    grub.enable = false;
    generic-extlinux-compatible.enable = true;
  };


  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    # registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    # nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };

    environment.systemPackages = with pkgs; [ vim git helix fff bat python3
      lazydocker
      btop
      nodejs_20
      certbot
      fzf
    ];

    virtualisation.docker = {
      enable = true;
    };

    users = {
      defaultUserShell = pkgs.zsh;
      users."leswell" = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "docker"
          "netwromanager"

        ];
        useDefaultShell = true;
      };
    };

    fileSystems = {
      "/" = {
        device = "/dev/disk/by-label/NIXOS_SD";
        fsType = "ext4";
        options = [ "noatime" ];
      };
    };

    hardware.enableRedistributableFirmware = true;
    system.stateVersion = "23.11";
  };
}