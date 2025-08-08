{inputs, pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.keylightctl.nixosModules.lenovo
    inputs.hardware.nixosModules.lenovo-ideapad-15ach6
  ];


  # conservation mode
  systemd.services.fix-ideapad-conservation-mode = {
    description = "Fix permissions for ideapad_acpi conservation_mode";
    wantedBy = [ "multi-user.target" ];
    after = [ "local-fs.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.coreutils}/bin/chmod 666 /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode";
    };
  };
  services.udev.packages = [
    (pkgs.writeTextDir "/etc/udev/rules.d/99-ideapad-conservation.rules" ''
      SUBSYSTEM=="platform", KERNEL=="VPC2004:00", ATTR{conservation_mode}="*", MODE="0664", GROUP="users"
    '')				 
  ];
}