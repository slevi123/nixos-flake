{...}:
{
  plugins.nvim-tree = {
    enable = true;

    openOnSetup = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>NvimTreeToggle<CR>";
      options = {
        desc = "Toggle Nvim Tree";
      };
    }
    
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>NvimTreeFocus<CR>";
      options = {
        desc = "Focus Nvim Tree";
      };
    }
    {
      mode = "n";
      key = "<leader>tff";
      action = "<cmd>NvimTreeFocus<CR>";
      options = {
        desc = "Focus curretn file in the tree";
      };
    }
  ];
}

