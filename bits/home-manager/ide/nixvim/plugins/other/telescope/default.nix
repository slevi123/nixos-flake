{ ... }:
{
  plugins.telescope = {
    enable = true;
    extensions = {
      zoxide.enable = true;
    };
  };

  keymaps = [
    # {
    #   mode = "n";
    #   key = "<leader>ff";
    #   action = "<cmd>Telescope find_files<CR>";
    #   options = {
    #     desc = "Find Files";
    #   };
    # }

    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<CR>";
      options = {
        desc = "Live Grep";
      };
    }

    {
      mode = "n";
      key = "<leader>p";
      action = "<cmd>Telescope commands<CR>";
      options = {
        desc = "Find Commands";
      };
    }
    {
      mode = "n";
      key = "<C-p>";
      action = "<cmd>Telescope find_files<CR>";
      options = {
        desc = "Find Files";
      };
    }
  ];
}
