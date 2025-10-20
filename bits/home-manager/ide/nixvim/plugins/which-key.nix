_: {
  plugins.which-key = {
    enable = true;
    settings = {
      show_help = true;
      keys = {
        # scroll_down = "<C-down>"; # Scroll down with Ctrl+Down
        # scroll_up = "<C-up>"; # Scroll up with Ctrl+Up
      };

      triggers = [
        {
          __unkeyed-1 = "<auto>";
          mode = "nxsot";
        }
        # {
        #   __unkeyed-2 = "<localleader>";
        #   mode = [ "i" ];
        # }
      ];
    };

  };

  keymaps = [

    {
      mode = [
        "i"
        "t"
      ];
      key = "<localleader>";
      action = "<cmd>WhichKey<CR>";
      options = {
        desc = "Open WhichKey";
      };
    }
    # {
    #   mode = "n";
    #   key = "<leader>";
    #   action = "<cmd>WhichKey<CR>";
    #   options = {
    #     desc = "Open WhichKey";
    #   };
    # }

    # {
    #   mode = "v";
    #   key = "<leader> ";
    #   action = "<cmd>WhichKey<CR>";
    #   options = {
    #     desc = "Open WhichKey";
    #   };
    # }
  ];
}
