


{ config, pkgs, lib, ... }:


{
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  
  virtualisation.docker = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [ vim git helix fff bat python3 
    lazydocker btop
    nodejs_20
    certbot
#    gitlab-runner
    fzf
   ];

  users = {
    defaultUserShell = pkgs.zsh;
    users."leswell" = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" "networkmanager" ];

      useDefaultShell = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "23.11";
}
