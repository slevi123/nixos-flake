{...} : {
  imports = [
    ./display-manager.nix
    ./cpu.nix
    ./users.nix
    ./vpn.nix
    ./ollama.nix
    # ./gitlab-runner.nix
    # ./virt.nix
    ./bootloader.nix
    ./hybrid-graphics.nix
    ./firewall.nix

    ./specialisations/hyperland

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];
}