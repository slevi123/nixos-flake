{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    imports = [
      ./nixvim-full.nix
    ];
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
