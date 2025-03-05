{...}:
{
  plugins.which-key = {
    enable = true;

    settings = {
      show_help = true; 
      # triggers = [
      #   {
      #     __unkeyed-1 = "<auto>";
      #     mode = "nxsotc";
      #   }
      # ];
    };

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
      mode = "v";
      key = "<leader>";
      action = "<cmd>WhichKey<CR>";
      options = {
        desc = "Open WhichKey";
      };
    }
  ];
}

