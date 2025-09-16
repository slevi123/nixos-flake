{ ... }:
{
  plugins.yazi = {
    enable = true;

    settings = {
      enable_mouse_support = true;
    };
  };

  keymaps = [
    {
      key = "<leader>-";
      mode = [
        "n"
        "v"
      ];
      action = "<cmd>Yazi<cr>";
      options = {
        desc = "Open yazi at the current file";
      };
    }
    {
      # Open in the current working directory
      key = "<leader>cw";
      action = "<cmd>Yazi cwd<cr>";
      options = {
        desc = "Open the file manager in nvim's working directory";
      };
    }
    {
      key = "<c-up>";
      action = "<cmd>Yazi toggle<cr>";
      options = {
        desc = "Resume the last yazi session";
      };
    }
  ];
}
