{inputs, ...}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/lualine.nix
    ./plugins/nvim-tree.nix
    ./plugins/telescope.nix
    ./plugins/which-key.nix
    ./plugins/startup/alpha.nix

    # ======== might want in future
    # --> startup
    # tip
    # veil
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
    plugins = {
      web-devicons.enable = true;
      direnv.enable = true;
      treesitter.enable = true;
      bufferline.enable = true;


      oil.enable = true;
    };


     keymaps = [
      {
      	mode = "n";
        key = "<leader>bl";
        action = "<cmd>bnext<CR>";
        options = {
          desc = "Next buffer";
        };
      } 

      {
      	mode = "n";
        key = "<leader>bh";
        action = "<cmd>bprev<CR>";
        options = {
          desc = "Previous buffer";
        };
      } 
    ];
 
  };
}
