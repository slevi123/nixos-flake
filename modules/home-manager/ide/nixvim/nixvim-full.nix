{pkgs, ...}: {
  imports = [
    ./plugins/lines-n-bars/lualine.nix
    ./plugins/startup/alpha.nix
    ./plugins/nvim-tree.nix
    ./plugins/telescope.nix
    ./plugins/which-key.nix
    ./plugins/auto-save.nix
    ./plugins/session/auto-session.nix
    ./plugins/indent/indent-blankline.nix
    # ./plugins/mini
    


    # ======== might want in future
    # --> startup
    # tip
    # veil
  ];

  colorschemes.catppuccin.enable = true;
  plugins = {
    web-devicons.enable = true;
    direnv.enable = true;
    treesitter.enable = true;
    bufferline.enable = true;


    oil.enable = true;
  };

    opts = {
      number = true;
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
}