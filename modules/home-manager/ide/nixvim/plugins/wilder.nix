{ ... }:
{
  plugins.wilder = {
    enable = true;
    enableCmdlineEnter = true;
    modes = [
      ":"
      "?"
      "/"
    ];
  };

  keymaps = [
    # {
    #   mode = "n";
    #   key = "<leader>";
    #   action = "<cmd>WhichKey<CR>";
    #   options = {
    #     desc = "Open WhichKey";
    #   };
    # }
  ];
}
