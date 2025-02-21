{...}:
{
  programs.nixvim = {
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
    ];
  };
}

