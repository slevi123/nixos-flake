##-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
## ==================Manual Setup For==============
##----------------------Ulauncher------------------
## extensions, settings, theme, etc...
##---------------------Burn My Windows-------------
## to copy profile files in ~/.config/burn-my-windows/profiles to new user
## ==================END of Manual Setup===========
# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      inputs.hyprpanel.overlay

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default
      # Or define it inline
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "leswellhm";
    homeDirectory = "/home/leswellhm";

    # keyboard = {
    #   layout = "us,hu+qwerty,ro"; # Define the layouts
    #   options = "lv3:ralt_switch"; # Set XKB options
    # };
    shellAliases = {
      exa = "eza --icons";
      ls = "exa --icons";
      lstree = "exa --tree";
      ll = "exa -l";
      la = "exa -a";
      lla = "exa -la";
      py = "/run/current-system/sw/bin/python -q";
      keylight = "py " + toString (../. + "/related-projects/lenovo-ideapad-legion-keyboard-led/keylight.py");
      # z = "zoxide";
    };

    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
