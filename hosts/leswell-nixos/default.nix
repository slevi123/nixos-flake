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
    ../parts/comfy.nix

    "${self}/bits/nixos/hardware/gpu/hybrid-nvidia.nix"
    "${self}/bits/nixos/hardware/gpu/cuda"
    "${self}/bits/nixos/hardware/battery/upower"
    "${self}/bits/nixos/hardware/embedded/udev.nix"

    "${self}/bits/nixos/bootloader/grub"
    "${self}/bits/nixos/kernel"

    "${self}/bits/nixos/environment/languages/npm"
    "${self}/bits/nixos/environment/nix"
    "${self}/bits/nixos/environment/gui/gaming"
    # "${self}/bits/nixos/hardware/sensors/iio-sensor"
    "${self}/bits/nixos/environment/tty/comphy.nix"

    "${self}/bits/nixos/environment/gui/display-manager/gdm"
    # "${self}/bits/nixos/environment/gui/desktop-environment/gnome"
    "${self}/bits/nixos/environment/gui/window-manager/hyprland"
    # "${self}/bits/nixos/environment/gui/menu/ulauncher"
    # "${self}/bits/nixos/environment/window-manager/niri"
    "${self}/bits/nixos/users"
    "${self}/bits/nixos/firewall"
    # "${self}/bits/nixos/kvm/input-leap"

    "${self}/bits/nixos/packages"
    "${self}/bits/nixos/i18n_i10n"

    "${self}/bits/nixos/cpu/power-profiles-daemon"
    "${self}/hardware/lenovo-gaming3-15ach6"
    "${self}/hardware/benq-gw2270"

    "${self}/bits/nixos/agenix"
    "${self}/bits/nixos/virtualisation/docker"
    "${self}/bits/nixos/virtualisation/waydroid"

    "${self}/bits/nixos/hardware/networking"
    "${self}/bits/nixos/hardware/bluetooth"
    "${self}/bits/nixos/home-assistant"
    "${self}/bits/nixos/program/torrent/transmission.nix"
    "${self}/bits/nixos/program/usb-images/ventoy"
    # "${self}/bits/nixos/program/snapd"

    # temporary
    # "${self}/bits/nixos/ide/jupyter" # for faculty
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
      experimental-features = "nix-command flakes no-url-literals";
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
    substituters = [ "https://nix-community.cachix.org" ];
    trusted-substituters = [ "https://nix-community.cachix.org" ];
    trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
  };
}
