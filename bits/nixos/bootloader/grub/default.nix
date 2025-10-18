{ inputs, ... }:
{
  imports = [
    inputs.darkmatter.nixosModule
  ];

  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        darkmatter-theme = {
          enable = true;
          style = "nixos";
        };
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
