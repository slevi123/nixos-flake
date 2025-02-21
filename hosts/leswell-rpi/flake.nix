{
	description = "my raspberry based home server config";

	inputs = {
		fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz";
  	nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2405.*.tar.gz";
	};

	outputs = { nixpkgs, fh, ... } @ inputs: {
    nixosConfigurations.leswell-rpi = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        {
          environment.systemPackages = [ fh.packages.aarch64-linux.default ];
        }
	./nixos/configuration.nix
        ./shell.nix
        ./ssh.nix
        ./cron.nix
        ./firewall.nix
        ./vpn.nix
        # ./gitlab-runner.nix
        # ./printer.nix
      ];
    };
  };
}
