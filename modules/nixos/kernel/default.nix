{...}:
{
  boot = {
    # kernelPackages = pkgs.linuxKernel.packages.linux_6_6; kernel version
    kernel.sysctl = {
      "vm.swappiness" = 10;
      "kernel.sysrq" = 80;  #  doesnt works (magic keys for frozen system)
    };
    #extraModprobeConfig = ''
    #  options nvidia NVreg_PreserveVideoMemoryAllocations=1
    #  options nvidia NVreg_TemporaryFilePath=/var/tmp
    #'';
  };
}