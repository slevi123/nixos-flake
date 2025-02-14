{inputs, ...}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.keylightctl.nixosModules.lenovo
    inputs.hardware.nixosModules.lenovo-ideapad-15ach6
  ];
}