{inputs, pkgs, ...}: {

  imports = [
    ./plugins/lines-n-bars/lualine.nix
    ./plugins/startup/alpha.nix
    ./plugins/nvim-tree.nix
    ./plugins/telescope.nix
    ./plugins/which-key.nix
    ./plugins/auto-save.nix
    ./plugins/session/auto-session.nix
    ./plugins/indent/indent-blankline.nix
    ./plugins/indent/guess-indent.nix
    # ./plugins/mini
    ./plugins/wilder.nix
    


    # ======== might want in future
    # --> startup
    # tip
    # veil
  ];

  colorschemes.catppuccin.enable = true;
  plugins = {
    web-devicons.enable = true;
    direnv.enable = true;
    treesitter.enable = true;
    bufferline.enable = true;


    oil.enable = true;
  };

  extraPlugins = [
    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "auto-indent";
    #   src = pkgs.fetchFromGitHub {
    #       owner = "VidocqH";
    #       repo = "auto-indent.nvim";
    #       rev = "46801cf8857d42a20a73c40b0a5d3dfe8b2b6192";
    #       hash = "sha256-dubpVupLfc81Jvb4woSQ63n2+VsJCRjnvDzkFTQE2MQ=";
    #       # license = "MIT";
    #   };
    # })
  ];

  opts = {
    number = true;
  };


  keymaps = [
    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>bnext<CR>";
      options = {
        desc = "Next buffer";
      };
    } 

    {
      mode = "n";
      key = "<leader>bh";
      action = "<cmd>bprev<CR>";
      options = {
        desc = "Previous buffer";
      };
    } 
  ];
}