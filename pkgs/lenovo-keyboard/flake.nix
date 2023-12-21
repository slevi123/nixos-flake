{
  description = "Nix flake wrapper around InstinctEx's Github repo for lenovo ideapad keyboard control";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    repo.url = "github:InstinctEx/lenovo-ideapad-legion-keyboard-led";
    repo.flake = false;
  };

  outputs = { self, nixpkgs, repo, ... }: 
  let 
    system = "x86_64-linux";
  in rec {
    inherit nixpkgs;

    # packages.${system} = {
    #   keylight = buildPythonPackage {
    #     pname = "lenovokey";  # Name for your package
    #     version = "1.0";      # Version of your package
    #     src = repo;       # Use the input for your Python project
    #   };

    #   default = keylight;
    # };

    python = nixpkgs.python311.withPackages(ps: with ps;[
      pyusb
    ]);

    apps.${system} = {
      keylight = {
          program = "${python}/bin/python";
          args = [ "lenovolight.py" ];
          src = repo;
          type = "app";
      };

      # default = keylight;
    };
  };
}
