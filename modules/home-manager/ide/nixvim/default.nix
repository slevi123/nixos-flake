{inputs, ...}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
    plugins = {
      web-devicons.enable = true;
      which-key.enable = true;
      lualine.enable = true;
      direnv.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      bufferline.enable = true;

      oil.enable = true;
    };


     keymaps = [
      {
        mode = "n";
        key = "<leader>";
        action = "<cmd>WhichKey<CR>";
        options = {
          desc = "Open WhichKey";
        };
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options = {
          desc = "Find Files";
        };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options = {
          desc = "Live Grep";
        };
      }
    ];
 
  };
}