# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  self,
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      self.overlays.additions
      self.overlays.modifications
      inputs.awesome-neovim-plugins.overlays.default
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  imports = [
    "${self}/modules/nixos/hardware/gpu/hybrid-nvidia.nix"
    "${self}/modules/nixos/hardware/gpu/cuda"
    "${self}/modules/nixos/hardware/battery/upower"    
    "${self}/modules/nixos/hardware/embedded/udev.nix"

    "${self}/modules/nixos/bootloader/grub"
    "${self}/modules/nixos/kernel"

    "${self}/modules/nixos/environment/nix"
    "${self}/modules/nixos/environment/gui/gaming"
    # "${self}/modules/nixos/hardware/sensors/iio-sensor"
    "${self}/modules/nixos/environment/tty/phi.nix"

    "${self}/modules/nixos/environment/gui/display-manager/gdm"
    # "${self}/modules/nixos/environment/gui/desktop-environment/gnome"
    "${self}/modules/nixos/environment/gui/window-manager/hyprland"
    # "${self}/modules/nixos/environment/gui/menu/ulauncher"
    # "${self}/modules/nixos/environment/window-manager/niri"
    "${self}/modules/nixos/users"
    "${self}/modules/nixos/firewall"
    # "${self}/modules/nixos/kvm/input-leap"

    "${self}/modules/nixos/packages"
    "${self}/modules/nixos/i18n_i10n"

    "${self}/modules/nixos/cpu/power-profiles-daemon"
    "${self}/hardware/lenovo-gaming3-15ach6"
    "${self}/hardware/benq-gw2270"

    "${self}/modules/nixos/agenix"
    "${self}/modules/nixos/virtualisation/docker"

    "${self}/modules/nixos/hardware/networking"
    "${self}/modules/nixos/hardware/bluetooth"
    "${self}/modules/nixos/home-assistant"
    "${self}/modules/nixos/program/torrent/transmission.nix"
    # "${self}/modules/nixos/program/snapd"

    # temporary
    # "${self}/modules/nixos/ide/jupyter" # for faculty
  ];

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      # Enable flakes
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  programs.nix-ld.enable = true;

  networking = {
    hostName = "leswell-nixos";
  };

  security = {
    rtkit.enable = true;
  };

  services = {

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    # flatpak.enable = true;
  };

  hardware = {
    firmware = [ pkgs.linux-firmware ];
  };

  environment = {
    variables = {
      FFF_CD_ON_EXIT = "1";
    };
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
