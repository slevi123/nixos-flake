{...}:
{
  plugins.which-key = {
    enable = true;
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
  ];
}

