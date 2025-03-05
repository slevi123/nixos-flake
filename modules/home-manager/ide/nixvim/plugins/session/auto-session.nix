{...}: 
{
  plugins.auto-session = {
    enable = true;
    settings = {
      auto_create = true;
      enabled = true;
      auto_save = true; 
      auto_restore = true; 

      root_dir = {
        __raw = "vim.fn.stdpath 'data' .. '/sessions/'";
      };

      session_lens = {
        load_on_setup = true;
      };

       # fix for nvim bug
      luaConfig = {
        post = ''
          require('auto-session').setup {
            pre_save_cmds = { 'NvimTreeClose' },
            post_restore_cmds = { 'NvimTreeOpen' },
          }
        '';
      };

    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>SessionSearch<CR>";
      options = {
        desc = "Search sessions";
      };
    }

    {
      mode = "n";
      key = "<leader>so";
      action = "<cmd>Autosession search<CR>";
      options = {
        desc = "Open a session from picker";
      };
    }

    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>Autosession delete<CR>";
      options = {
        desc = "Delete a session from picker";
      };
    }
  ];
}