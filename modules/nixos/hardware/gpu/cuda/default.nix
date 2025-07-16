{pkgs, lib, inputs, ...}:
{
 nix.settings = {
    substituters = [
      "https://cuda-maintainers.cachix.org"
    ];
    trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
  };

  environment.systemPackages = 
  let
    # pkgs-unfree = import  {system = pkgs.system; allowUnfree= true;};
    cudaPackages = inputs.nixpkgs-stable-unfree.legacyPackages.${pkgs.system}.cudaPackages;
  in
  [
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
  ];
}
