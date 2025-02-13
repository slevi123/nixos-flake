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
  self,
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [ 
    inputs.nix-index-database.hmModules.nix-index
    # inputs.agenix.homeManagerModules.default
    ../../modules/home-manager

    ../../modules/home-manager/environments/window-manager/hyprland/hypr-ecosystem
    ../../modules/home-manager/environments/window-manager/desk-env-parts/bar/waybar
    ../../modules/home-manager/environments/window-manager/desk-env-parts/notification
  ];
  

  home = {
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
      # z = "zoxide";
    };

    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
