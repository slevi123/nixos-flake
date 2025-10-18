# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  self,
  inputs,
  lib,
  config,
  pkgs,
  stateVersion,
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
      inputs.nix4vscode.overlays.forVscode
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      cudaSupport = true;
    };
  };

  imports = [
    "${self}/bitss/nixos/hardware/gpu/hybrid-nvidia.nix"
    "${self}/bitss/nixos/hardware/gpu/cuda"
    "${self}/bitss/nixos/hardware/battery/upower"
    "${self}/bitss/nixos/hardware/embedded/udev.nix"

    "${self}/bitss/nixos/bootloader/grub"
    "${self}/bitss/nixos/kernel"

    "${self}/bitss/nixos/environment/languages/npm"
    "${self}/bitss/nixos/environment/nix"
    "${self}/bitss/nixos/environment/gui/gaming"
    # "${self}/bitss/nixos/hardware/sensors/iio-sensor"
    "${self}/bitss/nixos/environment/tty/comphy.nix"

    "${self}/bitss/nixos/environment/gui/display-manager/gdm"
    # "${self}/bitss/nixos/environment/gui/desktop-environment/gnome"
    "${self}/bitss/nixos/environment/gui/window-manager/hyprland"
    # "${self}/bitss/nixos/environment/gui/menu/ulauncher"
    # "${self}/bitss/nixos/environment/window-manager/niri"
    "${self}/bitss/nixos/users"
    "${self}/bitss/nixos/firewall"
    # "${self}/bitss/nixos/kvm/input-leap"

    "${self}/bitss/nixos/packages"
    "${self}/bitss/nixos/i18n_i10n"

    "${self}/bitss/nixos/cpu/power-profiles-daemon"
    "${self}/hardware/lenovo-gaming3-15ach6"
    "${self}/hardware/benq-gw2270"

    "${self}/bitss/nixos/agenix"
    "${self}/bitss/nixos/virtualisation/docker"
    "${self}/bitss/nixos/virtualisation/waydroid"

    "${self}/bitss/nixos/hardware/networking"
    "${self}/bitss/nixos/hardware/bluetooth"
    "${self}/bitss/nixos/home-assistant"
    "${self}/bitss/nixos/program/torrent/transmission.nix"
    "${self}/bitss/nixos/program/usb-images/ventoy"
    # "${self}/bitss/nixos/program/snapd"

    # temporary
    # "${self}/bitss/nixos/ide/jupyter" # for faculty
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
    enableAllFirmware = true;
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
}
