{ inputs, pkgs, ... }:
{

  imports = [
    ./plugins/lines-n-bars/lualine
    # ./plugins/startup/alpha.nix
    # ./plugins/nvim-tree.nix
    # ./plugins/auto-save.nix
    # ./plugins/session/auto-session.nix
    # ./plugins/indent/indent-blankline.nix
    # ./plugins/indent/guess-indent.nix
    # ./plugins/mini
    ./plugins/other/telescope
    ./plugins/wilder.nix
    ./plugins/which-key.nix
    ./plugins/file-manager/yazi
    ./plugins/other/noice
    ./plugins/other/fzf-lua
    ./plugins/git-integration/neogit
    ./settings/theme/catppuccin

    # ======== might want in future
    # --> startup
    # tip
    # veil
  ];

  plugins = {
    web-devicons.enable = true;
    # direnv.enable = true;
    # treesitter.enable = true;
    # bufferline.enable = true;

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

  globals = {
    mapleader = " "; # Szóköz normal módban
    maplocalleader = ",,"; # Opcionálisan local leader
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
