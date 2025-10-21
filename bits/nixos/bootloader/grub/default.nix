{
  inputs,
  efiSupport ? true,
  ...
}:
{
  imports = [ inputs.darkmatter.nixosModule ];

  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        inherit efiSupport;
        useOSProber = true;
        darkmatter-theme = {
          enable = true;
          style = "nixos";
        };
      };
      efi.canTouchEfiVariables = efiSupport;
    };
  };
}
