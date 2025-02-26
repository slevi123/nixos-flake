{...}:
{
  programs.nixvim = {
   plugins.telescope = {
      enable = true;
    };

    keymaps = [
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

      {
        mode = "n";
          key = "<leader>kf";
          action = "<cmd>Telescope keymapsi<CR>";
          options = {
            desc = "Find Keybindings";
          };
      }
    ];
  };
}

