{pkgs, ...} : {
    boot = {
        # boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6; kernel version
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